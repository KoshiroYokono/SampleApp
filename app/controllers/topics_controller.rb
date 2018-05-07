class TopicsController < ApplicationController
  def new
     @topic = Topic.new
  end


  def create
     @topic = current_user.topics.new(topic_params)
     if @topic.save
        redirect_to topics_path, notice: '投稿に成功しました'
     else
        flash.now[:alert] = "投稿に失敗しました"
        render :new
     end
  end

  def index
     @topics = Topic.all.order(created_at: :desc).includes(:favorite_users)
     # incluudesメソッド・・・指定したモデル（userモデル）も一緒にデータを一括で取得
     # ？紐づけているから使えるのか？？
  end

  def show
     @topic = Topic.find(params[:id])
  end

  def edit
     @topic = Topic.find(params[:topic_id])
  end

  def update
     @topic = Topic.find(params[:id])
     if @topic.update_attributes(topic_params_update)
        redirect_to "/comments/#{@topic.id}/index"
        flash[:notice] = '投稿を更新しました'
     else
        flash.now[:alert] = '更新に失敗しました'
        render :edit
     end
  end

  def destroy
     @topic = Topic.find(params[:topic_id])
     @topic.destroy
     redirect_to topics_path, notice: '投稿を削除しました'
  end

  private
  def topic_params
     params.require(:topic).permit(:image, :description)
  end

  def topic_params_update
     params.permit(:description)
  end
end

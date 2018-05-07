class FavoritesController < ApplicationController
  def index
     @favorite_topics = current_user.favorite_topics
  end

  def create
     favorite = Favorite.new
     favorite.user_id = current_user.id
     favorite.topic_id = params[:topic_id]
     if favorite.save
        redirect_to topics_path, notice: 'お気に入りに登録しました'
     else
        redirect_to topics_path, notice: 'お気に入りに登録に失敗しました'
     end
  end
    #  @topic = Topic.find(params[:topic_id])
    #  @favorite = Favorite.create(user_id: current_user.id, topic_id: params[:topic_id])
    #  @topics = Topic.all.order(created_at: :desc).includes(:favorite_users)
    #  respond_to do |format|
    #    format.html { redirect_to topics_path }
    #    format.js
    # end


  def destroy
     favorite = Favorite.find_by(user_id: current_user.id, topic_id: params[:topic_id])
     favorite.destroy
     redirect_to topics_path, notice: 'お気に入りを解除しました'
     # @topic = Topic.find(params[:topic_id])
     # favorite = Favorite.find_by(user_id: current_user.id, topic_id: params[:topic_id])
     # favorite.destroy
     # @topics = Topic.all.order(created_at: :desc).includes(:favorite_users)
     #
     # respond_to do |format|
     #   format.html { redirect_to topics_path }
     #   format.js
     # end
  end

end

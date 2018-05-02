class FavoritesController < ApplicationController
  def index
     @favorite_topics = current_user.favorite_topics
  end

  def create
     # debugger
     @favorite = Favorite.create(user_id: current_user.id, topic_id: params[:topic_id])
     @topics = Topic.all.order(created_at: :desc).includes(:favorite_users)
     # favorite.user_id = current_ser.id
     # favorite.topic_id = params[:topic_id]
     # if favorite.save
     #    redirect_to topics_path, notice: 'お気に入り登録しました'
     # else
     #    redirect_to topiccs_path, notice: 'お気に入り登録に失敗しました'
     # end
  end
  def destroy
     favorite = Favorite.find_by(user_id: currnet_user.id, topic_id: params[:topic_id])
     favorite.destroy
     @topics = Topic.all.order(created_at: :desc).includes?(:favorite_users)
  end
end

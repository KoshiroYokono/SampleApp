class CommentsController < ApplicationController
  def index
     @topic = Topic.find(params[:id])
     @comments = @topic.comments
     @comment = Comment.new
  end

  def create
     @comment = Comment.new
     @comment.content = params[:comment][:content]
     @comment.user_id = current_user.id
     @comment.topic_id = params[:comment][:topic_id]
     @topic = @comment.topic
     if @comment.save
        redirect_to "/comments/#{@comment.topic.id}/index", notice: 'コメントを投稿しました'
     else
        render 'index'
        flash.now[:notice] = 'コメント投稿に失敗しました'
     end
  end
end

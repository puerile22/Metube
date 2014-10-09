class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = Comment.create(user_id:params[:user_id],video_id:params[:video_id],comment:params[:comment])
    redirect_to :controller=>'videos',:action=>'show',:id=>params[:video_id]
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment:params[:comment][:comment])
    redirect_to :back
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    redirect_to :back
  end
end

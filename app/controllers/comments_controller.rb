class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = Comment.create(user_id:params[:user_id],video_id:params[:video_id],comment:params[:comment])
    redirect_to :controller=>'videos',:action=>'show',:id=>params[:video_id]
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment:params[:comment])
    # render json: @comment
    redirect_to :back, status: :see_other
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    redirect_to :back, status: :see_other
  end
end

class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    binding.pry
    @comment = Comment.create(user_id:current_user.id,video_id:params[:video_id],comment:params[:comment][:comment])
  end

  def update
  end

  def destroy
  end

end

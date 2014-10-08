class ListsController < ApplicationController
  before_action :authenticate_user!
  def show
    @list = List.where(playlist_id:params[:id])
  end

  def new
    @list = List.new
  end

  def create
    if List.find_by(lists_params).nil?
      @list = List.new(lists_params)
      @list.save
    end
    redirect_to :controller=>"videos",:action=>'show',:id => lists_params[:video_id]
  end

  def destroy
    @list = List.find(params[:id]).destroy
    redirect_to :controller=>'playlists',:action=>'show',:id=>@list.playlist.id
  end

  private
  def lists_params
    params.require(:list).permit(:video_id,:playlist_id)
  end
end

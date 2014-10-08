class PlaylistsController < ApplicationController
  before_action :authenticate_user!
  def index
    @playlists = current_user.playlists
  end

  def show
    @playlist = Playlist.find(params[:id])
    @list = @playlist.lists
    @videos = @playlist.videos 
  end

  def new
    @playlist = Playlist.new
  end

  def create
     @playlist = current_user.playlists.new(playlist_params)
    if @playlist.save
      redirect_to @playlist
    else
      render :new
    end
  end

  def edit
    @playlist = Playlist.find(params[:id])
  end

  def update
    @playlist_test = current_user.playlists.new(playlist_params)
    if @playlist_test.valid?
      @playlist = current_user.playlists.find(params[:id])
      @playlist.update(playlist_params)
      redirect_to @playlist
    else
      render :edit
    end
  end

  def destroy
    @playlist = Playlist.find(params[:id]).destroy
    redirect_to action:"index"
  end

  private
  def playlist_params
    params.require(:playlist).permit(:name, :author_id)
  end
end

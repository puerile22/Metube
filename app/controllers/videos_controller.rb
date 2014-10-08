class VideosController < ApplicationController
  def index
    @videos = Video.all
  end

  def show
    @id = params[:id].to_i
    @video = Video.find(@id)
    @playlists = Playlist.all
    @playlist = Playlist.new
    @list = List.new
  end

  def new
    @video = current_user.videos.new
  end

  def create
    @video = current_user.videos.new(video_params)
    if @video.save
      redirect_to @video
    else
      render :new
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video_test = current_user.videos.new(video_params)
    if @video_test.valid?
      @video = current_user.videos.find(params[:id])
      @video.update(video_params)
      redirect_to @video
    else
      render :edit
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.delete
    redirect_to :action => 'index'
  end
  private
  def video_params
    params.require(:video).permit(:title, :url, :author_id)
  end
end

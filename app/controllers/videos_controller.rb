require 'video_player'
class VideosController < ApplicationController
  def index
    @video = Video.all
  end
  def video
    @videos = Video.new
  end
  def search

  end
  def search_result
    if params[:search].blank?
      render :search
    else
      @search = params[:search]
      @result = Video.all.where("(title) LIKE :search OR genre LIKE :search", search:"%#{@search}%")
    end
  end
  def create
    @videos= Video.new(video_params)
    if @videos.save
      redirect_to root_path
    else
      render 'video'
    end
  end
  def youtube_embed(youtube_url)
    VideoPlayer::player(youtube_url,"640", "390", true)
  end




  def video_params
    params.require(:video).permit(:title, :genre, :video, :url)
  end
  helper_method :youtube_embed
end

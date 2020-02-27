class MusicsController < ApplicationController
  def index
    @video = Music.all
  end
  def video
    @videos = Music.new
  end
  def audio
    @videos = Music.new
  end
  def create
    @videos = Music.new(video_params)
    if @videos.save
      redirect_to root_path
    else
      render 'video'
    end
  end
  #arse out the ID from the URL, then generate the iframe HTML using this.
  def youtube_embed(youtube_url)
    VideoPlayer::player(youtube_url,"640", "390", true)
  end

  private
  def video_params
    params.require(:music).permit(:audio_title, :video_title, :audio_genre, :video_genre, :audio_url, :video_url, :audio, :video)
  end
  helper_method :youtube_embed

end
class AudiosController < ApplicationController
  def index
    @audio = Audio.all
  end
  def audio
    @audios = Audio.new
  end
  def create
    @audios = Audio.new(audio_params)
    if @audios.save
      redirect_to root_path
    else
      render 'audio'
    end
  end

  private
  def audio_params
    params.require(:audio).permit(:audio_title, :audio_genre, :audio_url, :audio)
  end
end
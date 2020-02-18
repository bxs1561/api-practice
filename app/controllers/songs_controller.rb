class SongsController < ApplicationController
  def index
    if params[:search].blank?
      redirect_to search_artist_path
    else
      @songs = Song.search(params[:search])

    end
    end
  end


class SongsController < ApplicationController
  def index

  end
  def search
    if params[:search].blank?
      render :index
    else
      @searchs = params[:search]
      @result = Song.all.where("(name) LIKE :search OR track_name LIKE :search", search:"%#{@searchs}%")
      # if params[:search].present?
    end
    end

    end




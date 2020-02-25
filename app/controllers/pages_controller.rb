class PagesController < ApplicationController
  def index

  end
  def search
    if params[:search].blank?
      redirect_to root_path and return
    else
      @parameter = params[:search].downcase
      #the below code print exact word
      # @results = User.all.where("lower(email) LIKE :search", search: @parameter)
      @results = Song.all.where("(name) LIKE :search", search: "%#{@parameter}%")
    end

  end

    end


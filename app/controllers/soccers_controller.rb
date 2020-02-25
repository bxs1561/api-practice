require 'httparty'
class SoccersController < ApplicationController
  def soccer_api
    api
    render json: @results
  end
  def index
    api
    @form_result = Soccer.order(:titles)


  end
  def api
    endpoint = "https://www.scorebat.com/video-api/v1/"
    response = HTTParty.get(endpoint)
    data = JSON.parse response.body
    res = data
    # @results = []
    res.map do |result|
      # {
      # dates = DateTime.parse(result["date"])
      # strftime('%b %d, %Y, %A | %l:%M %p')
          @results = Soccer.create(titles: result["title"], url: result["url"], thumbnail: result["thumbnail"], game_date: result["date"], competition_name: result["competition"]["name"])
          # @results.save
      # }
    end
  end

  def search
    if params[:search].blank?
      render :'soccers/index'
    else
      @searchs = params[:search]
      @result = Soccer.all.where("(titles) LIKE :search OR competition_name LIKE :search", search:"%#{@searchs}%")
    end
  end
end


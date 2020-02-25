require 'httparty'
class ApisController < ApplicationController
  include HTTParty
  def api_song
    api
    render json:@result
  end
  def index
    api
    @form_result = Song.order(:track_name)
  end


  def api
  response = HTTParty.get("https://itunes.apple.com/search?term=narayan+gopal")
  data = JSON.parse response.body
  results = data["results"]
  # @result = []
  results.each do |res|
    # @result<<{

        @result = Song.new(name: res["artistName"], track_name: res["trackName"], song_audio: res["previewUrl"])
        @result.save


    # }

  end

  end
  # def narayan_gopal
  #
  # end
end


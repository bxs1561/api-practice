class Api::V1::VideosController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    render json: Video.all
  end
  def create
    video_request = Video.new(video)
    video_request.status = :requested

    #This are here just for testing purposes
    # ride_request.pickup_time = DateTime.now
    # ride_request.drop_time = DateTime.now + 40.minutes
    # ride_request.pickup_address = Address.create(pickup_address_params)
    # ride_request.dropoff_address = Address.create(dropoff_address_params)

    if video_request.save
      @data = {
          success: true,
          message: 'Ride successfully requested.'
      }
    else
      @data = {
          error: true,
          message: video_request.errors.full_messages
      }
    end
    render json: @data
  end
  def video_params
    params.require(:video).permit(:title, :genre, :video, :url)
  end
  def look_up
    render json: {
        id: params[:q],
        video: '1',
        videos: {
            title: :title,
            genre: :genre,
            video: :video,
            url: :url
        }
    }
  end
end

class Api::V1::VideosRequestsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    videos = Video.all
    render json: videos
  end
  def create
    video_request = Video.new(video_params)
    video_request.status = :requested

    #This are here just for testing purposes
    video_request.title = Video.create(:title)
    video_request.genre = Video.create(:genre)
    video_request.video = Video.create(:video)
    video_request.url = Video.create(:url)


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

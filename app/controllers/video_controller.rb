class VideoController < ApplicationController
  before_action :load_video, only: [:show,:destroy]

  def index
    @videos = current_user.videos
  end

  def new
    @video = Video.new
  end

  def show
  end

  def create
    @video = current_user.videos.create(videos_params)
    if @video.save
      redirect_to @video
    else
      render new_video_path
    end
  end

  def destroy
    @video.destroy
    redirect_to video_index_path
  end
  private

  def load_video
    @video = Video.find(params[:id])
  end

  def videos_params
    params.require(:video).permit(:file,:name)
  end
end

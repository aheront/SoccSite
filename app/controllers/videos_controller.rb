class VideosController < ApplicationController
  before_action :load_video, only: [:show,:destroy]

  before_action :res_params

  def index
    @videos = res_params.videos
  end

  def new
    @res = res_params
    @video = Video.new
  end

  def show
  end

  def create
    @video =  res_params.videos.create(videos_params)
    if @video.save
     redirect_to user_videos_path(current_user.id)
    else
      render new_video_path
    end
  end

  def destroy
    @video.destroy
    redirect_to res_params
  end
  private

  def load_video
    @video = Video.find(params[:id])
  end

  def videos_params
    params.require(:video).permit(:file, :file_name)
  end
  def res_params
    if params[:user_id].nil?
      @res = Group.find(params[:group_id])
    else
      @res = User.find(params[:user_id])
    end
  end
end

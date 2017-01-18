class PhotosController < ApplicationController
  before_action :load_photo, only: [:show, :update, :edit, :destroy]

  before_action :res_params

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = res_params.photos.create(photos_params)
   if @photo.save
     redirect_to url_for([res_params, @photo])
   else
     render new_photo_path
   end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @photo.destroy
    redirect_to res_params
  end

  private

  def load_photo
    @photo = res_params.photos.find(params[:id])
    @res = res_params
  end

  def photos_params
    params.require(:photo).permit(:image, :name)
  end
  def res_params
    if params[:user_id].nil?
      @res = Group.find(params[:group_id])
    else
      @res = User.find(params[:user_id])
    end
  end

end

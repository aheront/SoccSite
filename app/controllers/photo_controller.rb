class PhotoController < ApplicationController
  before_action :load_photo, only: [:show, :update, :edit, :destroy]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.create(photos_params)
   if @photo.save
     redirect_to @photo
   else
     render new_photo_path
   end
  end

  def show
  end

  def edit
  end

  def update
      if @photo.update(photos_params)
        redirect_to @photo
      else
        render 'edit'
      end
  end

  def destroy
    @photo.destroy

    redirect_to photo_index_path
  end

  private

  def load_photo
    @photo = Photo.find(params[:id])
  end

  def photos_params
    params.require(:photo).permit(:image,:name)
  end

end

class PhotoController < ApplicationController
  before_action :authenticate_user!
  def index
    @photos=Photo.all
  end

  def new
    @photo=Photo.new
  end

  def create
    @photo= current_user.photos.create(photos_params)
   if @photo.save
     @user=User.find(current_user)
     @user.photo=@photo
     @user.save
     redirect_to @photo
   else
     render new_photo_path
   end
  end

  def show
    @photo=Photo.find(params[:id])
  end

  def edit
    @photo=Photo.find(params[:id])
  end
  def update
    def update
      @photo =Photo.find(params[:id])

      if @photo.update(photos_params)
        redirect_to @photo
      else
        render 'edit'
      end
    end
  end

  def destroy
    @photo= Photo.find(params[:id])
    @photo.destroy

    redirect_to photo_index_path
  end
  private
  def photos_params
    params.require(:photo).permit(:image,:name)
  end
end

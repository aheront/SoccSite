class PhotosController < ApplicationController
  before_action :load_photo, only: [:show, :update, :edit, :destroy,:like,:dislike,:edit_avatar]

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
    @user = res_params
  end

  def edit
  end

  def update
  end

  def destroy
    @photo.destroy
    redirect_to res_params
  end

  def like
    if Like.find_by(source:@photo,user:current_user).nil?
    @photo.likes.create(user:current_user)
    redirect_to user_photo_path(res_params,@photo)
    else
      dislike
    end
  end
  def dislike
    @photo.likes.where(user:current_user).first.delete
    redirect_to user_photo_path(res_params,@photo)
  end
  def edit_avatar
    if res_params == current_user
      current_user.photo = @photo
      current_user.save
      redirect_to current_user
    else
      current_user.photo = current_user.photos.create(image:@photo.image)
      current_user.save
      redirect_to current_user
    end
  end
  private

  def load_photo
    @photo = Photo.find(params[:id])
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
  def photo_params
    @res = Photo.find(params[:photo_id])
  end

end

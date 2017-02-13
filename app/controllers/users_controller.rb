class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new_avatar
    current_user.photo = current_user.photos.create(image_params)
    current_user.save
    redirect_to current_user
  end


  def show
    @user = User.find(params[:id])
  end

  private
  def image_params
    params.require(:photo).permit(:image)
  end
end

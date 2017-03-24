class UsersController < ApplicationController

  def index
    @users = current_user.friend.users
  end

  def request_friend_index
    @users = User.all
  end

  def all_people
    @users = User.all
  end

  def new_avatar
    current_user.photo = current_user.photos.create(image_params)
    current_user.save
    redirect_to current_user
  end

  def friend_new
    current_user.friend.users << User.find(params[:id])
    redirect_to user_path(User.find(params[:id]))
  end

  def friend_del
    @friend = User.find(params[:id])
    @friend = current_user.friend.users.delete(@friend)
    redirect_to user_path(User.find(params[:id]))
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def image_params
    params.require(:photo).permit(:image)
  end
end

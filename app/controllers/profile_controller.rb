class ProfileController < ApplicationController

  def index
    @users=User.all
  end

  def new

  end
  def show

    @user=User.find(params[:id])
    if @user.photo!=nil
    @avatar=Photo.find(@user.photo)
    else

    end
  end

  def create

  end

  def update

  end

  def destroy

  end
end

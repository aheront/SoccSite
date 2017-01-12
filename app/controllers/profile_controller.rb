class ProfileController < ApplicationController
  def index
    @users=User.all
  end
  def new

  end
  def show
    @user=User.find(current_user.id)
  end
  def create

  end
  def update

  end
  def destroy

  end
end

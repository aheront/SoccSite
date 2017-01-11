class ProfileController < ApplicationController
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

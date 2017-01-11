class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @user=User.find(current_user.id)
  end

  def new
  end

  def show
  end
end

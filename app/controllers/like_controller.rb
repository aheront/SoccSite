class LikeController < ApplicationController
  before_action :source_params, only: :create
  before_action :authenticate_user!
  def index
  end

  def new
    @like=Like.new
  end

  def show
  end

  def create
    if @like.save
      redirect_to @like.source
    else

    end
  end

  def update
  end

  def destroy
  end
  private
  def source_params
    params.require(:like).permit(:source)
  end
end

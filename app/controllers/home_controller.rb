class HomeController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
  end

  def show
  end
end

class PostController < ApplicationController
  before_action :authenticate_user!

  before_action :load_post, only: [:show, :destroy]

  def new
    @post = Post.new
  end

  def show
  end

  def create
    @post = current_user.posts.create(posts_params)
    if @post.save
      @ph =  Photo.create(image_params)
      @ph.source = @post
      @post.photos << @ph
      redirect_to @post
    else
      render profile_path(current_user)
    end
  end

  def destroy
    @post.destroy
    redirect_to profile_path(current_user)
  end
  private

  def load_post
    @post = Post.find(params[:id])
  end

  def posts_params
    params.require(:post).permit(:name,:text)
  end
  def image_params
    params.require(:post).permit(:image)
  end
end

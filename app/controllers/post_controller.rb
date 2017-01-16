class PostController < ApplicationController
  before_action :authenticate_user!

  before_action :load_post, only: [:show, :destroy,:update]

  def new
    @post = Post.new
  end

  def show
  end

  def create
    @post = current_user.posts.create(posts_params)
    if @post.save
      if image_params.present?
        @post.photos.create(image_params)
      end
      redirect_to @post
    else
      render profile_path(current_user)
    end
  end
  def update
    @post.likes.create(user:current_user)
    redirect_to @post if @post.save
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

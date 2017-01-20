class PostsController < ApplicationController
  before_action :authenticate_user!

  before_action :res_params

  before_action :load_post, only: [:show, :destroy,:update]

  def new
    @res = res_params
    @post = Post.new
  end

  def show
  end

  def create
    @post = res_params.posts.create(posts_params)
    if @post.save
      if image_params.present?
        @post.photos.create(image_params)
      end
      redirect_to url_for([res_params,@post])
    else
      render 'posts/new'
    end
  end
  def update
  end

  def destroy
    @post.destroy
    redirect_to user_path(current_user)
  end
  private

  def load_post
    @post = res_params.posts.find(params[:id])
  end

  def posts_params
    params.require(:post).permit(:name,:text)
  end
  def image_params
    params.require(:post).permit(:image)
  end
  def res_params
    if params[:user_id].nil?
    @res = Group.find(params[:group_id])
    else
    @res = User.find(params[:user_id])
    end
  end
end

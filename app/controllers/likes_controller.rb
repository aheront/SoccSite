class LikesController < ApplicationController
  before_action :source_params, only: :create
  before_action :authenticate_user!
  before_action :res_params
  before_action :res_paramsm
  def index
  end

  def new
    @like = Like.new
  end

  def show
  end

  def create
    @like = res_paramsm.likes.create()
    @like.user_id = current_user.id
    if Like.find_by(source:@like.source,user_id:@like.user_id).present?
      Like.find_by(source:@like.source,user_id:@like.user_id).delete
      redirect_to url_for([@res,@res1])
    else
    if @like.save
      redirect_to url_for([@res,@res1])
    end
    end
  end

  def update
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
  end
  private
  def source_params
    params.require(:like).permit(:source)
  end
  def res_params
    if params[:user_id].nil?
      @res = Group.find(params[:group_id])
    else
      @res = User.find(params[:user_id])
    end
  end
  def res_paramsm
    if params[:photo_id].nil?
      @res1 = res_params.posts.find(params[:post_id])
    else
      @res1 = res_params.photos.find(params[:photo_id])
    end
  end
end

class GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :update,:new_avatar]

  before_action :load_group, only: [:show, :destroy,:update,:new_avatar]

  def index
   @groups = Group.all
  end

  def new
   @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    if @group.save
      redirect_to @group
    else
      render new_group_path
    end
  end

  def show
    @photo = @group.photos.last
  end

  def update
  end

  def destroy
    @group.destroy
    redirect_to groups_index_path
  end
  def new_avatar
    @group.photos.create(image_params)
    redirect_to @group
  end

  private

  def group_params
    params.require(:group).permit(:name,:description)
  end

  def image_params
    params.require(:photo).permit(:image)
  end

  def load_group
    @group = Group.find(params[:id])
  end
end

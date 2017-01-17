class GroupsController < ApplicationController
  before_action :authenticate_user!

  before_action :load_group, only: [:show, :destroy,:update]

  def index
   @groups = Group.all
  end

  def new
   @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    if @group.save
      if image_params.present?
        @group.photo = @group.photos.create(image_params)
      end
      redirect_to @group
    else
      render new_group_path
    end
  end

  def show
  end

  def update
  end

  def destroy
    @group.destroy
    redirect_to groups_index_path
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

  def image_params
    params.require(:group).permit(:image)
  end

  def load_group
    @group = Group.find(params[:id])
  end
end

class AudiosController < ApplicationController
  before_action :load_audio, only: :destroy

  before_action :res_params

  def index
    @res = res_params
    @audios = current_user.audios
    @audio = Audio.new
  end

  def new
    @audio = Audio.new
  end

  def create
    @audio = res_params.audios.create(audios_params)

  end

  def destroy
    @audio.destroy
    redirect_to res_params
  end
  private

  def load_audio
    @audio = Audio.find(params[:id])
  end

  def audios_params
    params.require(:audio).permit(:sound)
  end

  def res_params
    if params[:user_id].nil?
      @res = Group.find(params[:group_id])
    else
      @res = User.find(params[:user_id])
    end
  end
end

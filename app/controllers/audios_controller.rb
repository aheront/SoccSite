class AudiosController < ApplicationController
  before_action :load_audio, only: :destroy

  before_action :res_params

  def index
    @res = res_params
    @audios = current_user.audios
  end

  def new
    @audio = Audio.new
  end

  def create
    @audio = res_params.audios.create(audios_params)
    if @audio.save
      redirect_to user_audios_path(current_user.id)
    else
      render new_audio_path
    end
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

class AudioController < ApplicationController
  before_action :load_audio, only: :destroy

  def index
    @audios = current_user.audios
  end

  def new
    @audio = Audio.new
  end

  def create
    @audio = current_user.audios.create(audios_params)
    if @audio.save
      redirect_to audio_index_path
    else
      render new_audio_path
    end
  end

  def destroy
    @audio.destroy
    redirect_to audio_index_path
  end
  private

  def load_audio
    @audio = Audio.find(params[:id])
  end

  def audios_params
    params.require(:audio).permit(:sound,:name)
  end
end

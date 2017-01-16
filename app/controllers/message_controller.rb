class MessageController < ApplicationController
  before_action :load_message, only: [:show, :update, :destroy]

  def index
    @messages = Message.where("user_id = ? OR user_from = ?", current_user.id, current_user.id)
  end

  def new
    @message = Message.new
  end

  def show
  end

  def create
    @message = Message.new(message_params)
    @message.user_from = current_user.id
    if @message.save
      redirect_to message_index_path
    else
      flash.now[:error]='Некоректне повідомлення'
      render :new
    end
  end

  def update
  end

  def destroy
    @message.destroy
    redirect_to message_index_path
  end
  private
  def message_params
    params.require(:message).permit(:user_id,:message_text)
  end
  def load_message
    @message = Message.find(params[:id])
  end
end

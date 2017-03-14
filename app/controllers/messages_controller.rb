class MessagesController < ApplicationController
  before_action :load_message, only: [:show, :update, :destroy]

  before_action :authenticate_user!

  def index
    @message = Message.new
    @message.dialog = current_user.dialogs.find(params[:dialog_id])
    @messages = current_user.dialogs.find(params[:dialog_id]).messages.order(created_at: :desc)
  end

  def new
    @message = Message.new
    @message.dialog = current_user.dialogs.find(params[:dialog_id])
  end

  def show
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.dialog = Dialog.find(params[:dialog_id])
    if @message.save
      if image_params.present?
        @message.photos.create(image_params)
      end
      redirect_to user_dialog_messages_path(current_user.id,@message.dialog.id)
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
    params.require(:message).permit(:message_text, :dialog_id,:user_id)
  end
  def load_message
    @message = Message.find(params[:id])
    @dialog = Dialog.find(params[:dialog_id])
  end
  def image_params
    params.require(:message).permit(:image)
  end
end

class DialogsController < ApplicationController
  def index
    @dialogs = current_user.dialogs
    @dialogs = @dialogs.order(updated_at: :desc)
    Message.all.order(created_at: :desc)
  end

  def new
    @dialog = Dialog.new
  end

  def show
    @dialog = Dialog.find(params[:id])
    @messages = @dialog.messages
    redirect_to user_dialog_messages_path(current_user.id,@dialog.id)
  end

  def create
    @dialog = Dialog.new(params_dialog)
    @dialog.users << current_user
    if @dialog.save
      redirect_to user_dialogs_path(current_user.id)
    end
  end

  def destroy
    @dialog = Dialog.find(params[:id])
    @dialog.destroy
    redirect_to user_dialogs_path(current_user.id)
  end

  private
  def params_dialog
    params.require(:dialog).permit(:name,:user_ids)
  end
end

class Users::RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email,
                                 :password, :password_confirmation,
                                 :birthday,:sex,photo_attributes:[:image])
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email,
                                 :password, :password_confirmation,
                                 :current_password,:birthday,:sex,photo_attributes:[:image,:id])
  end
end

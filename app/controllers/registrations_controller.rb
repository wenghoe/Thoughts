# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(_resource)
    my_thoughts_path
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :current_password)
  end
end

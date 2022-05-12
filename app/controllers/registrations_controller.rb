#Ce controller permet de prendre en compte les autorisations pour créer un compte utilisateur

class RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication, only: [:new, :create]

  def new
    authorize User
    super
  end

  def create
    authorize User
    super
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  protected

  def sign_up(resource_name, resource)
    true
  end
end

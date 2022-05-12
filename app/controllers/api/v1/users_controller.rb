class Api::V1::UsersController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  # CSRF error (accès non autorisé) -> Désactive CSRF:
  # protect_from_forgery with: :null_session

  def index
    @users = policy_scope(User)
  end
end

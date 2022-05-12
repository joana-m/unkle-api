class Api::V1::UsersController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  # CSRF error (accès non autorisé) -> Désactive CSRF:
  # protect_from_forgery with: :null_session

  def index
    @users = policy_scope(User)
  end

  def destroy
    @user = User.find(params[:id])
    authorize @user
    @user.destroy
    render json: { message: "User supprimé." }
  end
end

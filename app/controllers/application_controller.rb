class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit::Authorization

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  acts_as_token_authentication_handler_for User
  # CSRF error -> Deactivating CSRF:
  protect_from_forgery with: :null_session

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def pundit_user
    User.find_by(email: request.headers["X-User-Email"])
  end
end

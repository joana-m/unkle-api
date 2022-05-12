class Api::V1::ContratClientsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  def index
    @contrat_clients = policy_scope(ContratClient)
  end
end

class Api::V1::ContratClientsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  before_action :set_contrat_client, only: [ :show ]

  def index
    @contrat_clients = policy_scope(ContratClient)
  end

  def show
  end

  private

  def set_contrat_client
    @contrat_client = ContratClient.find(params[:id])
    authorize @contrat_client
  end
end

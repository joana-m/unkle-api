class Api::V1::ContratClientsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  before_action :set_contrat_client, only: [:show]

  def index
    @contrat_clients = policy_scope(ContratClient)
  end

  def show
  end

  def create
    @contrat_client = ContratClient.new(contrat_client_params)
    contrat = Contrat.find(params[:contrat_id])
    @contrat_client.contrat = contrat
    user = User.find_by(email: request.headers["X-User-Email"])

    # Vérification que l'option n'a pas déjà été souscrite
    uniqueness = option_uniqueness(user, contrat)

    @contrat_client.user_id = user.id
    authorize @contrat_client

    if uniqueness
      statut(@contrat_client)
      @contrat_client.numero = "#{user.id}#{@contrat_client.contrat_id}FR"
      @contrat_client.save
      render json: { message: "Vous avez bien souscrit au contrat #{@contrat_client.numero}" }
    else
      render json: { status: :unprocessable_entity }
    end
  end

  # Résiliation du contrat
  def update
    @contrat_client = ContratClient.find(params[:id])
    authorize @contrat_client
    @contrat_client.update!(date_de_fin_params)
    statut(@contrat_client)
    if @contrat_client.save
      render json: { status: :ok, message: "Vous avez bien modifié la date de fin du contrat #{@contrat_client.numero} au #{@contrat_client.date_de_fin}" }
    else
      render json: { status: :unprocessable_entity }
    end
  end

  private

  def statut(contrat_client)
    if contrat_client.date_de_fin.nil? || contrat_client.date_de_fin > Date.today
      contrat_client.statut = 'Pending'
    elsif !contrat_client.date_de_fin.nil? && (contrat_client.date_de_fin > Date.today || contrat_client.date_de_fin.nil?)
      contrat_client.statut = 'Active'
    else
      contrat_client.statut = 'Finished'
    end
  end

  def option_uniqueness(user, contrat)
    options_deja_souscrites = user.options.pluck(:id)
    options_choisies = contrat.options.pluck(:id)

    uniqueness = true
    options_choisies.each do |option|
      uniqueness = false if options_deja_souscrites.include? option
    end
  end

  def set_contrat_client
    @contrat_client = ContratClient.find(params[:id])
    authorize @contrat_client
  end

  def contrat_client_params
    params.require(:contrat_client).permit(:date_de_debut, :date_de_fin)
  end

  def date_de_fin_params
    params.require(:contrat_client).permit(:date_de_fin)
  end
end

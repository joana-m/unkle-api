class Api::V1::ContratsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User

  def create
    @contrat = Contrat.new

    contrat_options = params[:options].map(&:to_i)

    combinaisons_existantes = Contrat.all
    combinaison_choisie = contrat_options

    # Vérification de l'unicité du contrat
    option_uniqueness = true

    combinaisons_existantes.each do |combinaison|
      option_uniqueness = false if combinaison.options.pluck(:id).sort == combinaison_choisie.sort
    end

    if option_uniqueness
      authorize @contrat, policy_class: ApplicationPolicy
      @contrat.save
      contrat_options.each do |option|
        option.to_i
        ContratOption.create(contrat_id: @contrat.id, option_id: option)
      end
      render json: { statut: :ok, message: "Le contrat a bien été créé." }
    else
      render_error
    end
  end
end

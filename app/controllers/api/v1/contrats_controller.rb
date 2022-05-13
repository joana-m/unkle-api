class Api::V1::ContratsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User

  def create
    @contrat = Contrat.new
    authorize @contrat, policy_class: ApplicationPolicy

    combinaison_choisie = params[:contrat][:options]

    if !(combinaison_choisie.nil?)

      combinaison_choisie.map! do |id|
        ContratOption.new(contrat: @contrat, option_id: id)
      end

      # Vérification de l'unicité du contrat
      combinaisons_existantes = Contrat.all
      option_uniqueness = true

      combinaisons_existantes.each do |combinaison|
        option_uniqueness = false if combinaison.options.pluck(:id).sort == combinaison_choisie.sort
      end

      if option_uniqueness
        @contrat.save
        render json: { statut: :ok, message: "Le contrat a bien été créé." }
      else
        render json: { status: :unprocessable_entity }
      end

    else
      render json: { status: :unprocessable_entity }
    end
  end

  private

  def contrat_params
    params.require(:contrat).permit(options: [])
  end
end

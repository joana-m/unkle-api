class UpdateDateJob < ApplicationJob
  queue_as :default

  def perform(contrat_client)
    if contrat_client.date_de_fin == Date.tomorrow
      contrat_client.status = 'Finished'
      contrat_client.save
    end
  end
end

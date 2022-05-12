class ContratClient < ApplicationRecord
  belongs_to :contrat
  belongs_to :user

  has_many :contrat_options, through: :contrats
  has_many :options, through: :contrat_options
end

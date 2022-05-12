class Contrat < ApplicationRecord
  has_many :contrat_options, dependent: :destroy
  has_many :options, through: :contrat_options

  has_many :contrat_clients
  has_many :users, through: :contrat_clients
end

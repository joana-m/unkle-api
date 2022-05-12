class Option < ApplicationRecord
  has_many :contrat_options
  has_many :contrats, through: :contrat_options
end

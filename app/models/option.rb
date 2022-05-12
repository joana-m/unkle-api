class Option < ApplicationRecord
  CATEGORIES = ["Tous risques", "Vols", "Incendie", "Cambriolage en semaine", "Cambriolage le week-end"]
  has_many :contrat_options
  has_many :contrats, through: :contrat_options

  validates :categorie, inclusion: { in: CATEGORIES }, presence: true
end

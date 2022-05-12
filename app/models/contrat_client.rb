class ContratClient < ApplicationRecord
  belongs_to :contrat
  belongs_to :user

  has_many :contrat_options, through: :contrats
  has_many :options, through: :contrat_options

  validates :date_de_debut, presence: true
  validate :date_de_fin_ne_peut_etre_dans_le_passe, :date_de_fin_ne_peut_etre_avant_la_date_de_debut

  def date_de_fin_ne_peut_etre_dans_le_passe
    if !date_de_fin.nil? && date_de_fin < Date.today
      errors.add(:date_de_fin, "La date de fin ne peut être dans le passé.")
    end
  end

  def date_de_fin_ne_peut_etre_avant_la_date_de_debut
    if !date_de_fin.nil? && date_de_fin < date_de_debut
      errors.add(:date_de_fin, "La date de fin ne peut être avant la date de début.")
    end
  end
end

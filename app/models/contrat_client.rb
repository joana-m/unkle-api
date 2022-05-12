class ContratClient < ApplicationRecord
  belongs_to :contrat
  belongs_to :user
end

class ContratOption < ApplicationRecord
  belongs_to :option
  belongs_to :contract
end

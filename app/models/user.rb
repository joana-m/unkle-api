class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_token_authenticatable

  has_many :contrat_clients, dependent: :destroy
  has_many :contrats, through: :contrat_clients
  has_many :contrat_options, through: :contrats
  has_many :options, through: :contrat_options
end

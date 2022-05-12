class CreateContratClients < ActiveRecord::Migration[6.1]
  def change
    create_table :contrat_clients do |t|
      t.string :numero
      t.string :statut
      t.date :date_de_debut
      t.string :date_de_fin
      t.string :date
      t.references :contrat, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

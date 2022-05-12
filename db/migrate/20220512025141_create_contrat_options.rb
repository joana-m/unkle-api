class CreateContratOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :contrat_options do |t|
      t.references :option, null: false, foreign_key: true
      t.references :contrat, null: false, foreign_key: true

      t.timestamps
    end
  end
end

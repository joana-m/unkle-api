class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options do |t|
      t.string :categorie
      t.string :description
      t.string :identifiant

      t.timestamps
    end
  end
end

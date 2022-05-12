class CreateContrats < ActiveRecord::Migration[6.1]
  def change
    create_table :contrats do |t|

      t.timestamps
    end
  end
end

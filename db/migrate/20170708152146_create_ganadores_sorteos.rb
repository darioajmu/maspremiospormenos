class CreateGanadoresSorteos < ActiveRecord::Migration
  def change
    create_table :ganadores_sorteos do |t|
      t.integer :sorteo_id
      t.timestamps null: false
    end
  end
end

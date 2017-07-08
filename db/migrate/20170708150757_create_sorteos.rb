class CreateSorteos < ActiveRecord::Migration
  def change
    create_table :sorteos do |t|
      t.integer :premio_id
      t.integer :participacion_id

      t.timestamps null: false
    end
  end
end

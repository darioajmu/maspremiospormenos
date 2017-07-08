class CreateParticipaciones < ActiveRecord::Migration
  def change
    create_table :participaciones do |t|
      t.integer :usuario_id
      t.boolean :usada, default: false
      t.timestamps null: false
    end
  end
end

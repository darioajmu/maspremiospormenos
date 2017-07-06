class CreateSimpleObjects < ActiveRecord::Migration
  def change
    create_table :simple_objects do |t|
      t.string :type
      t.string :codigo
      t.string :nombre

      t.timestamps null: false
    end
  end
end

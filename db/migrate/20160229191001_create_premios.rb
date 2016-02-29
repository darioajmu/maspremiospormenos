class CreatePremios < ActiveRecord::Migration
  def change
    create_table :premios do |t|

      t.timestamps null: false
    end
  end
end

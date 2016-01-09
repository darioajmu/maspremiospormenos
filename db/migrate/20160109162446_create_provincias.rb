class CreateProvincias < ActiveRecord::Migration
  def change
    create_table :provincias do |t|

      t.timestamps null: false
    end
  end
end

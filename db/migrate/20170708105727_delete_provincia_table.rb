class DeleteProvinciaTable < ActiveRecord::Migration
  def change
    drop_table :provincias
  end
end

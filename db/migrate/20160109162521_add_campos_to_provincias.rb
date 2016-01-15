class AddCamposToProvincias < ActiveRecord::Migration
  def change
      add_column :provincias, :codigo, :string
      add_column :provincias, :nombre, :string
      add_column :provincias, :fechadebaja, :date
  end
end

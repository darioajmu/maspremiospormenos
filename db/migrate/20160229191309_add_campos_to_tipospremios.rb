class AddCamposToTipospremios < ActiveRecord::Migration
  def change
      add_column :tipospremios, :codigo, :string
      add_column :tipospremios, :nombre, :string
      add_column :tipospremios, :fechadebaja, :date
  end
end

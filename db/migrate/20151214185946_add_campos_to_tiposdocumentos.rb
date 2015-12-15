class AddCamposToTiposdocumentos < ActiveRecord::Migration
  def change
    add_column :tiposdocumentos, :codigo, :string
    add_column :tiposdocumentos, :nombre, :string
    add_column :tiposdocumentos, :fechadebaja, :date

  end
end

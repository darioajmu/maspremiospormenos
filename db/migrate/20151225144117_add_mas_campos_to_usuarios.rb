class AddMasCamposToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :nombre, :string
    add_column :usuarios, :apellido1, :string
    add_column :usuarios, :apellido2, :string
    add_column :usuarios, :provincia_id, :integer
    add_column :usuarios, :ciudad, :string
    add_column :usuarios, :codigopostal, :decimal
    add_column :usuarios, :direccion, :string
    add_column :usuarios, :direccioncompleta, :string
    add_column :usuarios, :fechadenacimiento, :date
    add_column :usuarios, :sexo, :string
    add_column :usuarios, :movil, :decimal
  end

end

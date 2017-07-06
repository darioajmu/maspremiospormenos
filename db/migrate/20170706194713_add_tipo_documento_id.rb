class AddTipoDocumentoId < ActiveRecord::Migration
  def change
    add_column :usuarios, :tipo_documento_id, :integer
    add_column :premios, :tipo_premio_id, :integer
  end
end

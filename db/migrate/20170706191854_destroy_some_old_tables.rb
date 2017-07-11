class DestroySomeOldTables < ActiveRecord::Migration
  def change
    drop_table :tiposdocumentos
    drop_table :tipospremios
    remove_column :provincias, :fechadebaja
    remove_column :usuarios, :tiposdocumento_id
    remove_column :premios, :tipospremio_id
    remove_column :premios, :fechadebaja
  end
end

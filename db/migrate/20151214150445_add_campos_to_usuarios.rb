class AddCamposToUsuarios < ActiveRecord::Migration
  def change
      add_column :usuarios, :username, :string
      add_column :usuarios, :tiposdocumento_id, :integer
      add_column :usuarios, :documento, :string

  end
end

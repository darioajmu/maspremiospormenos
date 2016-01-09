class CreateTiposdocumentos < ActiveRecord::Migration
  def change
    create_table :tiposdocumentos do |t|

      t.timestamps
    end
  end
end

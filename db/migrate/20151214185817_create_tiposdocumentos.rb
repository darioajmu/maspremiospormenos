class CreateTiposdocumentos < ActiveRecord::Migration
  def change
    create_table :tiposdocumentos do |t|

      t.timestamps null: false
    end
  end
end

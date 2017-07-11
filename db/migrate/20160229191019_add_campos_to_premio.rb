class AddCamposToPremio < ActiveRecord::Migration
  def change
      add_column :premios, :codigo, :string
      add_column :premios, :nombre, :string
      add_column :premios, :fechadebaja, :date
      add_column :premios, :tipospremio_id, :integer
  end
end

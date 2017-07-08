class AddMoreFieldsToPremios < ActiveRecord::Migration
  def change
    add_column :premios, :fecha_hora_sorteo, :datetime
    add_column :premios, :numero_participaciones, :integer
    add_column :premios, :entregado, :boolean, default: false
  end
end

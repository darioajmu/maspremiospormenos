class ChengePremiosFields < ActiveRecord::Migration
  def change
    remove_column :premios, :entregado
    add_column :premios, :estado, :integer, default: 0
  end
end

class CreateTipospremios < ActiveRecord::Migration
  def change
    create_table :tipospremios do |t|

      t.timestamps null: false
    end
  end
end

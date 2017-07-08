class AddRoleIdToUsers < ActiveRecord::Migration
  def change
    add_column :usuarios, :role_id, :integer, default: 0
  end
end

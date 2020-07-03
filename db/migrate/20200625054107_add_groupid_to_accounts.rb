class AddGroupidToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :group_id, :integer
  end
end

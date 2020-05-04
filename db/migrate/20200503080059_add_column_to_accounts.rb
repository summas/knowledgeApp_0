class AddColumnToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :name, :string
    add_column :accounts, :auth, :string
    add_column :accounts, :organization, :string
  end
end

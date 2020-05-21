class AddDefaultToAccountsAuth < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:accounts, :auth, 3)
  end
end

class AddDelFlgTogroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :del_flg, :integer, default: 0, null: false
  end
end

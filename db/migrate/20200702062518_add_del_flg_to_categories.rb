class AddDelFlgToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :del_flg, :integer, default: 0, null: false
  end
end

class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.text :title
      t.text :content
      t.integer :category_id
      t.integer :group_id
      t.integer :account_id

      t.timestamps
    end
  end
end

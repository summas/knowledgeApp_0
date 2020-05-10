class AddColumnToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :disclosureRange_id, :string
  end
end

class CreateGroupRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :group_relations do |t|
      t.integer :group_id
      t.integer :account_id

      t.timestamps
    end
  end
end

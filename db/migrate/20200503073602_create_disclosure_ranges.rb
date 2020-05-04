class CreateDisclosureRanges < ActiveRecord::Migration[6.0]
  def change
    create_table :disclosure_ranges do |t|
      t.text :name

      t.timestamps
    end
  end
end

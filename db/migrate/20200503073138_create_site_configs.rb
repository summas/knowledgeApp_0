class CreateSiteConfigs < ActiveRecord::Migration[6.0]
  def change
    create_table :site_configs do |t|
      t.text :title
      t.text :subtitle
      t.text :style

      t.timestamps
    end
  end
end

class CreateSeasoningSpices < ActiveRecord::Migration[6.1]
  def change
    create_table :seasoning_spices do |t|
      t.integer :admin_id, null: false #管理者id(外部キー)
      t.string :classification, null: false
      t.string :name, null: false
      t.text :detail, null: false
      t.text :usega, null: false
      t.timestamps
    end
  end
end

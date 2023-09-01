class CreatePostForAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :post_for_admins do |t|
      t.integer :customer_id, null: false #会員id(外部キー)
      t.string :classification, null: false
      t.string :name, null: false
      t.text :detail, null: false
      t.text :usega, null: false
      t.timestamps
    end
  end
end

class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :customer_id, null: false #会員id(外部キー)
      t.text :comment, null: false
      t.text :genre
      t.timestamps
    end
  end
end

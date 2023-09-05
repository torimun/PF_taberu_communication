class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :customer_id, null: false #会員id(外部キー)
      t.integer :post_id, null: false #投稿id(外部キ)
      t.text :comment, null: false
      t.timestamps
    end
  end
end

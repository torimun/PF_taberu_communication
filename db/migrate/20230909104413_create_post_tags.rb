class CreatePostTags < ActiveRecord::Migration[6.1]
  def change
    create_table :post_tags do |t|
      # Postと関連付ける
      t.references :post, foreign_key: true
      # Tagと関連付けるためのカラム
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end

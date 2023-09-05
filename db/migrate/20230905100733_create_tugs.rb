class CreateTugs < ActiveRecord::Migration[6.1]
  def change
    create_table :tugs do |t|
      t.integer :post_id, null: false #投稿id(外部キー)
      t.string :tug, null: false
      t.timestamps
    end
  end
end

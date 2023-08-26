class CreatePostForAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :post_for_admins do |t|

      t.timestamps
    end
  end
end

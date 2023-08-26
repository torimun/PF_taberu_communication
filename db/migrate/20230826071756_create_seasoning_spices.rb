class CreateSeasoningSpices < ActiveRecord::Migration[6.1]
  def change
    create_table :seasoning_spices do |t|

      t.timestamps
    end
  end
end

class CreateTugs < ActiveRecord::Migration[6.1]
  def change
    create_table :tugs do |t|
      t.string :tug, null: false
      t.timestamps
    end
  end
end

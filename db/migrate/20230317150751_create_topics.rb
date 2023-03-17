class CreateTopics < ActiveRecord::Migration[7.0]
  def change
    create_table :topics do |t|
      t.string :title, null: false, unique: true
      t.string :theme, null: false
      t.string :purpose

      t.timestamps
    end
  end
end

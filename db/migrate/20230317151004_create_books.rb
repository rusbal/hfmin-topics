class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name, null: false, unique: true
      t.string :testament, null: false

      t.timestamps
    end
  end
end

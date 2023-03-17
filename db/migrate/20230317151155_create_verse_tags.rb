class CreateVerseTags < ActiveRecord::Migration[7.0]
  def change
    create_table :verse_tags do |t|
      t.string :tag, null: false, unique: true

      t.timestamps
    end
  end
end

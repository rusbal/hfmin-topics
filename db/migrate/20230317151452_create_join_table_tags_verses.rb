class CreateJoinTableTagsVerses < ActiveRecord::Migration[7.0]
  def change
    create_join_table :tags, :verses do |t|
      t.index [:tag_id, :verse_id]
    end
  end
end

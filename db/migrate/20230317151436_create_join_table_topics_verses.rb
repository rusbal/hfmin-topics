class CreateJoinTableTopicsVerses < ActiveRecord::Migration[7.0]
  def change
    create_join_table :topics, :verses do |t|
      t.index [:topic_id, :verse_id]
    end
  end
end

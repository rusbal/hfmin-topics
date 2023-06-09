# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_03_17_151452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "name", null: false
    t.string "testament", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "data_migrations", primary_key: "version", id: :string, force: :cascade do |t|
  end

  create_table "tags_verses", id: false, force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "verse_id", null: false
    t.index ["tag_id", "verse_id"], name: "index_tags_verses_on_tag_id_and_verse_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "title", null: false
    t.string "theme", null: false
    t.string "purpose"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "topics_verses", id: false, force: :cascade do |t|
    t.bigint "topic_id", null: false
    t.bigint "verse_id", null: false
    t.index ["topic_id", "verse_id"], name: "index_topics_verses_on_topic_id_and_verse_id"
  end

  create_table "verse_tags", force: :cascade do |t|
    t.string "tag", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "verses", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.string "chapter_verse", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_verses_on_book_id"
  end

  add_foreign_key "verses", "books"
end

ActiveRecord::Schema.define(version: 2022_06_23_211851) do

  create_table "albums", force: :cascade do |t|
    t.string "title"
    t.integer "rating"
    t.integer "released_in"
    t.string "genre"
    t.string "album_art"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "album_id"
    t.string "comment"
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.integer "album_id"
    t.integer "length"
    t.integer "likes"
  end

end

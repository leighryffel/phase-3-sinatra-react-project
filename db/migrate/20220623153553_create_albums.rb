class CreateAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.integer :rating
      t.integer :released_in
      t.string :genre
      t.string :album_art
    end
  end
end

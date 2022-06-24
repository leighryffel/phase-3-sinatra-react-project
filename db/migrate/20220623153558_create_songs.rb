class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :album_id
      t.integer :length
      t.integer :likes
    end
  end
end

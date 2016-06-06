class CreateCovers < ActiveRecord::Migration
  def change
    create_table :covers do | t |
        t.belongs_to :song, index: true
        t.string :title
        t.string :artist
        t.string :genre
        t.string :release_date
        t.timestamps
      end
  end
end

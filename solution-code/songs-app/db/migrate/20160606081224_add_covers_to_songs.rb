class AddCoversToSongs < ActiveRecord::Migration
  def change
    add_reference :songs, :cover, index: true
  end
end

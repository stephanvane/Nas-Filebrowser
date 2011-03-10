class CreateTracks < ActiveRecord::Migration
  def self.up
    create_table :tracks do |t|
      t.string :name
      t.integer :nr
      t.string :file
      t.references :album
      t.references :artist
    end
  end

  def self.down
    drop_table :tracks
  end
end

class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :track_name
      t.binary :song_audio

      t.timestamps
    end
  end
end

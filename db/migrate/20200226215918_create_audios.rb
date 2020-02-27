class CreateAudios < ActiveRecord::Migration[6.0]
  def change
    create_table :audios do |t|
      t.string :audio_title
      t.string :audio_genre
      t.string :audio_url
      t.binary :audio

      t.timestamps
    end
  end
end

class Song < ApplicationRecord
  # validates :name, presence: true, uniqueness: true
  validates :track_name, presence: true, uniqueness: true
  validates :song_audio, presence: true, uniqueness: true



end

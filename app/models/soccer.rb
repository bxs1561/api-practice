class Soccer < ApplicationRecord
  validates :thumbnail, presence: true, uniqueness: true

end

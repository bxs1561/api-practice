class Audio < ApplicationRecord
  mount_uploader :audio, AudioUploader
end

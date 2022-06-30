class Song < ApplicationRecord
  belongs_to :post
  validates :song, presence: true
  mount_uploader :song, SongUploader
end

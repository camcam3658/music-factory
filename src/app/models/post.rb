class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  has_one_attached :song
  default_scope -> { order(created_at: :desc) }
  validates :caption, presence: true
  validates :profile,  length: { maximum: 255 }
end

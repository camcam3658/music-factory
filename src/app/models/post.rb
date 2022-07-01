class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :song
  default_scope -> { order(created_at: :desc) }
  validates :caption, presence: true
end

class Post < ApplicationRecord
  belongs_to :user
  has_many :songs, dependent: :destroy
  accepts_nested_attributes_for :songs
end

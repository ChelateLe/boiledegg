class Collabo < ApplicationRecord
  validates :title, presence: true
  validates :image, presence: true

  has_many :users
  has_one_attached :image
end

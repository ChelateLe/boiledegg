class Collabo < ApplicationRecord
  validates :title, presence: true
  validates :image, presence: true

  has_many :users, through: :user_collabos
  has_one_attached :image
end

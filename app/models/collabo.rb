class Collabo < ApplicationRecord
  validates :title, presence: true
  validates :image, presence: true

  belongs_to :painter, class_name: "User", foreign_key: "painter_id"
  belongs_to :originator, class_name: "User", foreign_key: "originator_id"
  has_one_attached :image
end

class RequestBox < ApplicationRecord
  belongs_to :user

  has_many :message
  belongs_to :user
  has_one_attached :image
end

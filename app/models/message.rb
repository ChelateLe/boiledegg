class Message < ApplicationRecord
  validates :request, presence: true
  
  belongs_to :user
  belongs_to :request_box
  has_one_attached :image
end

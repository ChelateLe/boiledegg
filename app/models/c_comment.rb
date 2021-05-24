class CComment < ApplicationRecord
  validates :text, presence: true

  belongs_to :user
  belongs_to :collabo
end

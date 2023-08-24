class Review < ApplicationRecord
  belongs_to :booking
  has_one :user, through: :booking
  has_one :boat, through: :booking

  validates :booking, presence: true
end

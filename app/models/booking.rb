class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :boat
  has_one :reviews

  validates :user, presence: true
  validates :boat, presence: true
end

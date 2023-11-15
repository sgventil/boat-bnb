class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :boat
  has_many :reviews, dependent: :destroy


  validates :user, presence: true
  validates :boat, presence: true
end

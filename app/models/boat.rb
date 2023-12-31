class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_one_attached :photo

  validates :name, presence: true
  validates :user, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end

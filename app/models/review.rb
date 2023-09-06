class Review < ApplicationRecord
  belongs_to :booking

  has_one :user, through: :booking
  has_one :boat, through: :booking

  validates :booking, presence: true
  validate :rating_within_range

  private

  def rating_within_range
    if rating.present? && (rating < 1 || rating > 5)
      errors.add(:rating, "must be between 1 and 5")
    end
  end
end

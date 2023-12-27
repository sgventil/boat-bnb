class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  has_many :bookings
  has_many :boats, dependent: :destroy
  has_many :reviews, through: :bookings

  def self.from_omniauth(auth)
    return unless auth.present? && auth.info.present?

    user = User.from_omniauth(auth)

    user = where(email: auth.info.email).first_or_initialize do |new_user|
      new_user.email = auth.info.email
      new_user.password = Devise.friendly_token[0, 20]
    end

    user.save if user.new_record?

    user
  end

end

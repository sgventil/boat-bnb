class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :omniauthable

  has_many :bookings
  has_many :boats
  has_many :reviews, through: :bookings

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # Assuming the name field is available in the auth info
    end
  end

end

class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  has_many :bookings
  has_many :experiences_as_host, class_name: "Experience", foreign_key: :host_id
  has_many :bookings_as_host, class_name: "Booking", foreign_key: :host_id, through: :experiences_as_host, source: :bookings
  has_one_attached :photo
  has_many :favorites
  has_many :favorited_experiences, through: :favorites, foreign_key: :experience_id, source: :experience

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
end

class User < ApplicationRecord
  self.table_name = "knight_time_users"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, foreign_key: "knight_time_user_id"
  has_many :bookings, foreign_key: "knight_time_user_id"
  has_many :experiences_as_host, class_name: "KnightTimeExperience", foreign_key: :host_id
  has_many :bookings_as_host, class_name: "KnightTimeBooking", foreign_key: :host_id, through: :experiences_as_host, source: :bookings
  has_one_attached :photo
  has_many :favorites, foreign_key: "knight_time_user_id"
  has_many :favorited_experiences, through: :favorites, foreign_key: :knight_time_experience_id, source: :experience

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
end

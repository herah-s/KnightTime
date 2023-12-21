class User < ApplicationRecord
  self.table_name = "kt_users"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, foreign_key: "kt_user_id"
  has_many :bookings, foreign_key: "kt_user_id"
  has_many :experiences_as_host, class_name: "KtExperience", foreign_key: :host_id
  has_many :bookings_as_host, class_name: "KtBooking", foreign_key: :host_id, through: :experiences_as_host, source: :bookings
  has_one_attached :photo
  has_many :favorites, foreign_key: "kt_user_id"
  has_many :favorited_experiences, through: :kt_favorites, foreign_key: :kt_experience_id, source: :kt_experience

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
end

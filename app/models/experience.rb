class Experience < ApplicationRecord
  self.table_name = "knight_time_experiences"
  belongs_to :host, class_name: "KnightTimeUser"
  has_many :bookings, foreign_key: "knight_time_experience_id"
  has_many :reviews, through: :bookings
  has_one_attached :photo
  has_many :favorites, foreign_key: "knight_time_experience_id"

  validates :name, :description, :price, :address, :category, presence: true
  validates :description, length: { minimum: 10 }
  validates :name, :address, length: { maximum: 22 }
  validates :price, numericality: true
  validates :category, inclusion: { in: ["Jousting", "Archery", "Samurai", "Vikings", "Knights", "Ninja"] }

  # search function start
  include PgSearch::Model
  pg_search_scope :search_by_name_description_and_category,
                  against: %i[name description category],
                  using: {
                    tsearch: { prefix: true }
                  }
  # search function end
end

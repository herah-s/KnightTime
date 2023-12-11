class Booking < ApplicationRecord
  self.table_name = "knighttime_bookings"
  belongs_to :user, foreign_key: "knighttime_user_id"
  belongs_to :experience, foreign_key: "knighttime_experience_id"
  has_one :review, foreign_key: "knighttime_booking_id"
  has_many :messages, dependent: :destroy, foreign_key: "knighttime_booking_id"

  validates :start_date, :end_date, presence: true
  validates :end_date, comparison: { greater_than: :start_date }
  validates :total_price, numericality: true
  validates :status, inclusion: { in: ['pending', 'confirmed', 'rejected'] }

  def pending?
    status == 'pending'
  end
end

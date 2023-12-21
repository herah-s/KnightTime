class Booking < ApplicationRecord
  self.table_name = "kt_bookings"
  belongs_to :user, foreign_key: "kt_user_id"
  belongs_to :experience, foreign_key: "kt_experience_id"
  has_one :review, foreign_key: "kt_booking_id"
  has_many :messages, foreign_key: "kt_booking_id", dependent: :destroy

  validates :start_date, :end_date, presence: true
  validates :end_date, comparison: { greater_than: :start_date }
  validates :total_price, numericality: true
  validates :status, inclusion: { in: ['pending', 'confirmed', 'rejected'] }

  def pending?
    status == 'pending'
  end
end

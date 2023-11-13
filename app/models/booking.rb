class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :experience

  validates :start_date, end_date: true
  validates :end_date, comparison: { greater_than: :start_date }
  validates :total_price, numericality: true
  validates :status, inclusion: { in: ['pending', 'confirmed', 'rejected'] }
end

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :experience
  has_one :review

  validates :start_date, :end_date, presence: true
  validates :end_date, comparison: { greater_than: :start_date }
  validates :total_price, numericality: true
  validates :status, inclusion: { in: ['pending', 'confirmed', 'rejected'] }

  def pending?
    status == 'pending'
  end
end

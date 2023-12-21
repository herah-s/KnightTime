class Review < ApplicationRecord
  self.table_name = "kt_reviews"
  belongs_to :booking, foreign_key: "kt_booking_id"
  belongs_to :user, foreign_key: "kt_user_id"
  has_one :experience, through: :kt_booking
end

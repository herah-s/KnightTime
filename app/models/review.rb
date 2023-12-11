class Review < ApplicationRecord
  self.table_name = "knighttime_reviews"
  belongs_to :booking, foreign_key: "knighttime_booking_id"
  belongs_to :user, foreign_key: "knighttime_user_id"
  has_one :experience, through: :booking
end

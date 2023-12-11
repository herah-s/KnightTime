class Review < ApplicationRecord
  self.table_name = "knight_time_reviews"
  belongs_to :booking, foreign_key: "knight_time_booking_id"
  belongs_to :user, foreign_key: "knight_time_user_id"
  has_one :experience, through: :booking
end

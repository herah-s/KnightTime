class Message < ApplicationRecord
  self.table_name = "knight_time_messages"
  belongs_to :booking, foreign_key: "knight_time_booking_id"
  belongs_to :user, foreign_key: "knight_time_user_id"
end

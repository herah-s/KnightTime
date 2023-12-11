class Message < ApplicationRecord
  self.table_name = "knighttime_messages"
  belongs_to :booking, foreign_key: "knighttime_booking_id"
  belongs_to :user, foreign_key: "knighttime_user_id"
end

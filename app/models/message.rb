class Message < ApplicationRecord
  self.table_name = "kt_messages"
  belongs_to :booking, foreign_key: "kt_booking_id"
  belongs_to :user, foreign_key: "kt_user_id"
end

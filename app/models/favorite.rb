class Favorite < ApplicationRecord
  self.table_name = "knighttime_favorites"
  belongs_to :user, foreign_key: "knighttime_user_id"
  belongs_to :experience, foreign_key: "knighttime_experience_id"
end

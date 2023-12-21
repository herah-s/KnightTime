class Favorite < ApplicationRecord
  self.table_name = "kt_favorites"
  belongs_to :user, foreign_key: "kt_user_id"
  belongs_to :experience, foreign_key: "kt_experience_id"
end

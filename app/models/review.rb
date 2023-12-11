class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :user
  has_one :experience, through: :booking
end

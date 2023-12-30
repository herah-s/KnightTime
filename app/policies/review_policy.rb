class ReviewPolicy < ApplicationPolicy
  def create?
    user.bookings.where(experience: record.booking.experience).first.end_date < Date.today && record.booking.experience.reviews.where(user: user).empty?
  end

  def destroy?
    record.user == user
  end
end

class ExperiencePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    record.host == user
  end

  def create?
    update?
  end

  def destroy?
    update?
  end
end

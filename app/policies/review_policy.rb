class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    return true
  end

  def show?

  end

  def new?
    if record.booking.user == user
      return true
    else
      return false
    end
  end

  def create?
    new?
  end

  def edit?
    if record.booking.user == user
      return true
    else
      return false
    end
  end

  def update?
    edit?
  end

  def destroy?
    return false
  end
end

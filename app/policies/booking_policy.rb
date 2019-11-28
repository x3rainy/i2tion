class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    return true
  end

  def show?
    if record.user == user || record.tutor == user.tutor
      return true
    else
      return false
    end
  end

  def new?
    if user.tutor
      return user.tutor != record.tutor
    else
      return true
    end
  end

  def create?
    new?
  end

  def edit?
    if record.user == user || record.tutor == user.tutor
      return true
    else
      return false
    end
  end

  def update?
    edit?
  end

  def destroy?
    if record.user == user || record.tutor == user.tutor
      return true
    else
      return false
    end
  end
end

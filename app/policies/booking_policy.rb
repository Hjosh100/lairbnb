class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def index?
    return true
  end

  def renter_index?
    return true
  end

  def show?
    return true
  end

  def new?
    return create?
  end

  def create?
    return true
  end

  def update?
    record.user == user
  end

  def confirm?
    return true
  end

  def destroy?
    record.user == user
  end

  def show_no_bookings?
    record.none? { |booking| booking.lair.user == user }
  end
end

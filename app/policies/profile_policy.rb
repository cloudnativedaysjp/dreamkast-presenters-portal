class ProfilePolicy < ApplicationPolicy
  def show?
    record.id == profile.id
  end

  def edit?
    record.id == profile.id
  end

  def update?
    record.id == profile.id
  end

  def destroy?
    record.id == profile.id
  end
end
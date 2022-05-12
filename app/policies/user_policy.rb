class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.admin?
        scope.all
      else
        scope.where(id: user.id)
      end
    end
  end

  def index?
    true
  end

  def destroy?
    @user.admin?
  end
end

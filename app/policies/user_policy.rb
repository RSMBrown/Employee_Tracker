class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def initialize(user, division)
    @user = user
  end 

  def index? 
    user.role == 'admin'
  end 

  def new?
    user.role == 'admin'
  end 

  def create?
    user.role == 'admin'
  end 

  def edit? 
    user.role == 'admin'
  end 

  def update?
    user.role == 'admin'
  end 

  def employee_index?
    user.role == 'hr_manager'
  end

  def show?
    user.role == 'hr_manager'
    user.role == 'project_manager'
    user.role == 'employee'
    user.role == 'admin'
  end 

  def employee_new?
    user.role == 'hr_manager'
  end

  def employee_create?
    user.role == 'hr_manager'
  end

  def employee_edit?
    user.role == 'hr_manager'
  end

  def employee_update?
    user.role == 'hr_manager'
  end

  def destroy?
    user.role == 'hr_manager'
    user.role == 'admin'
  end
end

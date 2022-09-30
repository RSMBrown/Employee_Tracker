class DivisionPolicy < Struct.new(:user, :division)
  attr_reader :user, :division

  def initialize(user, division)
    @user = user
    @division = @division 
  end 

  def index?
    user.role == 'hr_manager' || user.role == 'admin'
  end

  def show?
    user.role == 'hr_manager' || user.role == 'admin'
  end 

  def new?
    user.role == 'hr_manager' || user.role == 'admin'
  end

  def create?
    user.role == 'hr_manager' || user.role == 'admin'
  end

  def edit?
    user.role == 'hr_manager' || user.role == 'admin'
  end

  def update?
    user.role == 'hr_manager' || user.role == 'admin'
  end

  def destroy?
    user.role == 'hr_manager' || user.role == 'admin'
  end
end

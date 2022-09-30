class ProjectPolicy < Struct.new(:user, :project)
  attr_reader :user, :project

  def initialize(user, project)
    @user = user
    @project = project 
  end 

  def index?
    user.role == 'project_manager' || user.role == 'admin'
  end

  def show?
    user.role == 'project_manager' || user.role == 'admin'
  end 

  def new?
    user.role == 'project_manager' || user.role == 'admin'
  end

  def create?
    user.role == 'project_manager' || user.role == 'admin'
  end

  def edit?
    user.role == 'project_manager' || user.role == 'admin'
  end

  def update?
    user.role == 'project_manager' || user.role == 'admin'
  end

  def destroy?
    user.role == 'project_manager' || user.role == 'admin'
  end
end

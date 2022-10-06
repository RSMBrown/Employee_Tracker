class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :project_users, dependent: :destroy
  has_many :projects, through: :project_users
  has_many :division_users, dependent: :destroy
  has_many :divisions, through: :division_users

  def roles
    %w{project_manager hr_manager employee admin}
  end

  def name_with_initial
    "#{name.first}. #{sname}"
  end 
end

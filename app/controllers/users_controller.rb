class UsersController < ApplicationController
    before_action :authenticate_user!

    def index 
        @users = User.all 
    end 

    def show 
        @users = User.all
        @user = User.find(params[:id])
        @projects = @user.projects
    end 

    def new 
        @user = User.new
    end 

    def create 
        @user = User.create(user_params)

        if @user.save 
            redirect_to @user 
        else 
            render :new 
        end 
    end 

    def edit 
        @user = User.find(params[:user_id])
    end 

    def update 
        @user = User.find_by(params[:user_id])

        if @user.update!(user_params)
            redirect_to @user 
        else 
            render :edit 
        end 
    end 

    def destroy 
        @user = User.find(params[:user_id])
        @user.destroy

        redirect_to users_employees_path
    end 

    def employee_index
        @users = User.all
    end 

    def employee_new 
        @user = User.new 
    end 

    def employee_create 
        @user = User.create(user_employee_params)

        if @user.save
            redirect_to users_employees_path
        else 
            render :employee_new 
        end 
    end 

    def employee_edit 
        @user = User.find(params[:user_id])
    end 

    def employee_update 
        @user = User.find_by(params[:user_id])

        if @user.update!(user_employee_params)
            redirect_to @user
        else 
            render :employee_edit
        end 
    end 

    private 
    def user_params
        params.require(:user).permit(:role, :name, :sname, :email, :password, :password_confirmation)
    end 

    def user_employee_params
        params.require(:user).permit(:role, :name, :sname, :email, :password, :password_confirmation, :division)
    end 
end

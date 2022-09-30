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
            flash[:success] = 'New user successfully created!'
            redirect_to @user 
        else 
            flash[:error] = 'creation failed!!'
            render :new 
        end 
    end 

    def edit 
        @user = User.find(params[:user_id])
    end 

    def update 
        @user = User.find_by(params[:user_id])

        if @user.update!(user_params)
            flash[:success] = 'New user successfully updated!'
            redirect_to @user 
        else 
            flash[:error] = 'Update failed!!'
            render :edit 
        end 
    end 

    def destroy 
        @user = User.find(params[:user_id])
        @user.destroy

        if current_user.role == 'hr_manager'
            redirect_to users_employees_path
        else 
            redirect_to users_path 
        end 
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
            flash[:success] = 'New employee successfully created!'
            redirect_to users_employees_path
        else 
            flash[:error] = 'creation failed!!'
            render :employee_new 
        end 
    end 

    def employee_edit 
        @user = User.find(params[:user_id])
    end 

    def employee_update 
        @user = User.find_by(params[:user_id])

        if @user.update!(user_employee_params)
            flash[:success] = 'New employee successfully created!'
            redirect_to @user
        else 
            flash[:error] = 'Update failed!!'
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

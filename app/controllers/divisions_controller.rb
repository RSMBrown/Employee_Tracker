class DivisionsController < ApplicationController

    def index 
        @divisions = Division.all 
        authorize @divisions
    end 

    def show 
        @division = Division.find(params[:id])
        @users = @division.users.all 
        authorize @division
    end 

    def new 
        @division = Division.new 
        @users = User.all
        @employees = []
        @users.each do |user|
            if user.role == 'employee'
                @employees.push(user)
            end 
        end 
        authorize @division
    end 

    def create 
        @division = current_user.divisions.create(division_params)
        @users = User.all
        @employees = []
        @users.each do |user|
            if user.role == 'employee'
                @employees.push(user)
            end 
        end 

        authorize @division

        if @division.save 
            flash[:error] = 'new division successfully created!'
            redirect_to @division
        else
            flash[:error] = 'New division failed!'
            render :new 
        end 
    end 

    def edit 
        @division = Division.find(params[:id])
        @users = User.all
        @employees = []
        @users.each do |user|
            if user.role == 'employee'
                @employees.push(user)
            end 
        end 
        authorize @division
    end 

    def update 
        @division = current_user.divisions.find(params[:id])
        @users = User.all
        @employees = []
        @users.each do |user|
            if user.role == 'employee'
                @employees.push(user)
            end 
        end 
        authorize @division

        if @division.update(division_params) 
            flash[:error] = 'Update division successful!'
            redirect_to @division
        else
            flash[:error] = 'Update division failed!'
            render :edit  
        end 
    end 

    def destroy 
        @division = Division.find(params[:id])
        authorize @division
        @division.destroy 

        redirect_to divisions_path 
    end 

    private 
    def division_params
        params.require(:division).permit(:name, user_ids: [])
    end 
end

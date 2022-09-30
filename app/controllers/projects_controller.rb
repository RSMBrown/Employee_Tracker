class ProjectsController < ApplicationController

    def index 
        @projects = Project.all
        authorize @projects
    end 

    def show 
        @project = Project.find(params[:id])
        @users = @project.users.all 
        authorize @project
    end 

    def new 
        @project = Project.new 
        @users = User.all
        @employees = []
        @users.each do |user|
            if user.role == 'employee'
                @employees.push(user)
            end 
        end 
        authorize @project
    end 

    def create 
        @project = Project.create(project_params)
        @users = User.all
        @employees = []
        @users.each do |user|
            if user.role == 'employee'
                @employees.push(user)
            end 
        end 
        authorize @project

        if @project.save
            flash[:success] = 'New project successfully created!'
            redirect_to @project 
        else
            flash[:error] = 'New project failed!'
            render :new 
        end 
    end 

    def edit 
        @project = Project.find(params[:id])
        @users = User.all
        @employees = []
        @users.each do |user|
            if user.role == 'employee'
                @employees.push(user)
            end 
        end 
        authorize @project
    end 

    def update 
        @project = Project.find(params[:id])
        @users = User.all
        @employees = []
        @users.each do |user|
            if user.role == 'employee' 
                @employees.push(user)
            end 
        end 
        authorize @project

        if @project.update(project_params) 
            flash[:success] = 'New project successfully updated!'
            redirect_to @project 
        else
            flash[:error] = 'Update project failed!'
            render :edit  
        end 
    end 

    def destroy 
        @project = Project.find(params[:id])
        @project.destroy 

        redirect_to projects_path
        authorize @project
    end 

    private 
    def project_params
        params.require(:project).permit(:title, user_ids:[])
    end 
end

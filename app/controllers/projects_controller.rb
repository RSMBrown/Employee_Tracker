class ProjectsController < ApplicationController

    def index 
        @projects = Project.all
        authorize @projects
    end 

    def show 
        @project = Project.find(params[:id])
        @users = User.all
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
        @project = current_user.projects.create(project_params)
        @users = User.all
        @employees = []
        @users.each do |user|
            if user.role == 'employee'
                @employees.push(user)
            end 
        end 
        authorize @project

        if @project.save 
            redirect_to @project 
        else
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
        @project = current_user.projects.find(params[:id])
        @users = User.all
        @employees = []
        @users.each do |user|
            if user.role == 'employee'
                @employees.push(user)
            end 
        end 
        authorize @project

        if @project.update(project_params) 
            redirect_to @project 
        else
            render :edit  
        end 
    end 

    def destroy 
        @project = Project.find(params[:id])
        authorize @project
        @project.destroy 

        redirect_to root_path 
    end 

    private 
    def project_params
        params.require(:project).permit(:title, :user_id)
    end 
end

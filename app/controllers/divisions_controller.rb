class DivisionsController < ApplicationController

    def index 
        @divisions = Division.all 
        authorize @divisions
    end 

    def show 
        @division = Division.find(params[:id])
        authorize @division
    end 

    def new 
        @division = Division.new 
        authorize @division
    end 

    def create 
        @division = current_user.divisions.create(division_params)
        authorize @division

        if @division.save 
            redirect_to @division
        else
            render :new 
        end 
    end 

    def edit 
        @division = Division.find(params[:id])
        authorize @division
    end 

    def update 
        @division = current_user.divisions.find(params[:id])
        authorize @division

        if @division.update(division_params) 
            redirect_to @division
        else
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
        params.require(:division).permit(:name, :user_id)
    end 
end
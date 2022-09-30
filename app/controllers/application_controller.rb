class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    def after_sign_in_path_for(resource)
        if current_user.role == 'hr_manager'
            '/divisions'
        elsif current_user.role == 'project_manager'
            '/projects'
        elsif current_user.role == 'employee'
            '/home'
        end
    end 

    before_action :update_allowed_parameters, if: :devise_controller?

    protected
    def update_allowed_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :sname, :role, :email, :password)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :sname, :role, :email, :password, :current_password)}
    end

    private
    def user_not_authorized
        flash[:alert] = 'You are not authorized to perform this action.'
        redirect_to root_path
    end
end

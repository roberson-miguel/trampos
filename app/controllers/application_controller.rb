class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
        devise_parameter_sanitizer.permit(:account_update, keys: [:role])
    end

    def authorize_headhunter
        unless current_user.headhunter?
        flash[:alert] = "Voce não tem autorização"
        redirect_to root_path
        end
    end

end

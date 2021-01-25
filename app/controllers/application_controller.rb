class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    # Metodo que redirecciona al index de cancan
    rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_path, :alert => exception.message
    end

    # Metodo que ayuda a guardar los parametros de el sign_up
    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :user_role) }
    end

end

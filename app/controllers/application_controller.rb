class ApplicationController < ActionController::Base
    # Metodo que redirecciona al index de cancan
    rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_path, :alert => exception.message
    end
end

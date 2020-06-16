class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_layout
    protect_from_forgery with: :exception
    
    protected
  
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :auth, :organization, :aicon])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :auth, :organization, :aicon])
      end

      def set_layout
        @auths = AUTH::NAME 
        @account = current_account
        @articleconfig = SiteConfig.find 1
        @categories = Category.all
      end
end

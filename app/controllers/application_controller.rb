class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
     before_action :authenticate_user!
     before_action :configure_permitted_parameters, if: :devise_controller?
     around_action :set_time_zone, if: :current_user
     
     private

     def set_time_zone(&block)
     Time.use_zone(current_user.time_zone, &block)
     end

     protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :time_zone, :email, :password)}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password, :password_confirmation, :time_zone)}
          end

end

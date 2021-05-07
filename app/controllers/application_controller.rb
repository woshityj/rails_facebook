class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :friend_request_notification, if: :current_user

    def friend_request_notification
        @friend_requests = Friend.where(:friend_1_id => current_user.id, :status => "requested")
    end

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username])
    end
end

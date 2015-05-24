class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  # authentication via devise
  before_action :authenticate_player_format!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def authenticate_player_format!
    if request.format == :json
      unless player_signed_in?
        render json: { error: 'authentication error' }, status: 401
      end
    else
      authenticate_player!
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper
  
  # This is available to views
  helper_method :current_user

  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    # Use this to get nil instead of an error if not user exist
    @current_user ||= session[:current_user_id] && User.find_by_id(session[:current_user_id]) 
  end
  
  before_filter :configure_permitted_parameters, :configure_devise_params, if: :devise_controller?
  
  def configure_permitted_parameters
  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation) }
  end    
    
  def configure_devise_params

    registration_params = [:preferences, :email, :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end
     
    rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
end

  
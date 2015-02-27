class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
	private

  def user_not_authorized
    flash[:alert] = "Acceso Denegado"
    redirect_to (request.referrer || root_path)
  end

  def configure_devise_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up).push(:email, :name, :username, :last_name, :credit_card, :cvv)
      devise_parameter_sanitizer.for(:sign_in).push(:email, :name, :username, :last_name, :credit_card, :cvv)
      devise_parameter_sanitizer.for(:account_update).push(:email, :name, :last_name, :credit_card, :cvv)
  end

  
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_customer!
    redirect_to new_session_path, alert: 'please sign in' unless customer_signed_in?
  end

  def customer_signed_in?
    session[:customer_id].present?
  end
  helper_method :customer_signed_in?

  def current_customer
    Customer.find session[:customer_id] if customer_signed_in?
  end
  helper_method :current_customer
end

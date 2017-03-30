class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  after_filter :clear_flash
  
  include ApplicationHelper
  
  
  private
  def clear_flash
    flash[:notice]=nil
    flash[:alert]=nil
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end 
  
  
end

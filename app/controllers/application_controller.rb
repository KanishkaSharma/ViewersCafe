class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  $mostTags = Tag.order(:occurence).limit(10)
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
  protected 
  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys:[:first_name,:last_name,:date_of_birth ,:profile_picture,:role,:firebase_id])
  end 	
end
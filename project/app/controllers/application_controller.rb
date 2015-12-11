class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user = Student.find_by(:account => session[:user_account])
    session[:user_type] = "student"
    	if !@current_user
    		@current_user = Company.find_by(:account => session[:user_account])
    		session[:user_type] = "company"
    	end
    @current_user
  end
  helper_method :current_user #face metoda current_user vizibila de catre view

  def authorize
    redirect_to '/login' unless current_user
  end

end
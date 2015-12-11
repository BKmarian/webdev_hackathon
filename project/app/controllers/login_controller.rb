class LoginController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :create
  def new
  end
  def create
    student = Student.find_by(:account => params[:account])
    # if the user exists AND the password entered is correct
    if student && student.authenticate(params[:password])
      # save the user id inside the browser cookie. This is how we keep the user logged in when they navigate around our website.
      session[:user_account] = student.account
      session[:user_type] = "student"
      redirect_to '/'
    else
      company = Company.find_by(:account => params[:account])
      if company && company.authenticate(params[:password])
        session[:user_account] = company.account
        session[:user_type] = "company"
        redirect_to '/'
      else      
        redirect_to '/login'
      end
    end
  end

  def destroy
    session[:user_account] = nil
    redirect_to '/login'
  end

end
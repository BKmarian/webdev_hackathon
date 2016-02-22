class LoginController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :authenticate
  def loginpage
    render template: '/layouts/application'
  end
  def authenticate
    student = Student.find_by(:email => params[:email])
    # if the user exists AND the password entered is correct
    if student && student.authenticate(params[:password])
      # save the user id inside the browser cookie. This is how we keep the user logged in when they navigate around our website.
      session[:user_account] = student.email
      session[:user_type] = "student"
      redirect_to :back
    else
      company = Company.find_by(:email => params[:email])
      if company && company.authenticate(params[:password])
        session[:user_account] = company.email
        session[:user_type] = "company"
        redirect_to :back
      else      
        redirect_to :back
      end
    end
  end

  def destroy
    session[:user_account] = nil
    session[:user_type] = nil
    redirect_to '/findjobs'
  end

end
class UsersController < ApplicationController
  
  def new
    session[:user_type] = "student"
  end

  def new_company
    session[:user_type] = "company"
  end

  def create
    if session[:user_type] == "student"
      user = Student.new(user_params)
    else
      user = Company.new(user_params)
    end
    #user = User.new(:name => params[:name],:email => params[:email], :password_digest => params[:password])
    if user.save
      session[:user_account] = user.account
      # if user.instance_of?Student
      #   session[:user_type] = "student"
      # else 
      #   session[:user_type] = "company"
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  private

  def user_params
    if session[:user_type] == "student"
      params.require(:student).permit(:account, :nume, :university, :password, :password_confirmation)
    else
      params.require(:company).permit(:account, :nume, :password, :password_confirmation)
    end
  end
end
class UsersController < ApplicationController
  #skip_before_filter :verify_authenticity_token, :only => :create

  def studentnew
      session[:user_type] = "student"
      user = Student.new(user_params)
    #user = User.new(:name => params[:name],:email => params[:email], :password_digest => params[:password])
    if user.save
      session[:user_account] = user.email
      redirect_to '/cool'
    else
      redirect_to '/login'
    end
  end

  def companynew
    session[:user_type] = "company"
    user = Company.new(user_params)
    if user.save
      session[:user_account] = user.email
      redirect_to '/cool'
    else
      redirect_to '/login'
    end
  end
  private

  def user_params
    if session[:user_type] == "student"
      params.require(:student).permit(:first_name, :last_name, :email , :mobile_number, :university, :password, :password_confirmation)
    else
      params.require(:company).permit(:name, :email, :mobile_number, :password, :password_confirmation)
    end
  end
end
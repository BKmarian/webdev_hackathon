class UsersController < ApplicationController
  #skip_before_filter :verify_authenticity_token, :only => :create

  def studentnew
      user = Student.new(user_params)
    #user = User.new(:name => params[:name],:email => params[:email], :password_digest => params[:password])
    if user.save
      session[:user_type] = "student"
      session[:user_account] = user.email
    end
    render nothing: true
  end

  def companynew
    user = Company.new(user_params)
    if user.save
      session[:user_type] = "company"
      session[:user_account] = user.email
    end
    render nothing: true
  end

  def createapplication
    job_id = params[:jobid]
    user = Student.find_by(:email => session[:user_account])
    Application.create(:job_id => job_id,:student_id => user.id)
    render nothing: true
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
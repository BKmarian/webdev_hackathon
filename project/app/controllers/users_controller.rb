class UsersController < ApplicationController
  #skip_before_filter :verify_authenticity_token, :only => :create
  def new_student
    session[:user_type] = "student"
    user = Student.new(user_params)
    if user.save
      session[:user_account] = user.email
    end
    redirect_to :back
  end

  def new_company
    session[:user_type] = "company"
    user = Company.new(user_params)
    if user.save
      session[:user_account] = user.email
    end
   redirect_to :back
 end

 def app
   @apps = Application.all
 end

 def job
   @jobs = Job.all
 end

 def apply
  job_id = params[:job_id]
  user = Student.find_by(:email => session[:user_account])
  application = Application.new(:job_id => job_id , :student_id => user.id)
  application.save
  redirect_to :back
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
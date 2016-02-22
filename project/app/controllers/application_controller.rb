class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  skip_before_filter :verify_authenticity_token, :only => :authenticate
  def current_user
    @current_user = Student.find_by(:email => session[:user_account])
    puts Student.where(:email => session[:user_account]).count
    if !@current_user
      @current_user = Company.find_by(:email => session[:user_account])
    end
    @current_user
  end
  helper_method :current_user #face metoda current_user vizibila de catre view

  def authorize
    redirect_to '/login' unless current_user
  end

  def search

    text = params[:search_text]
    if session[:user_type] == "student"
      #@jobs = Job.all.select { |k| k.title.downcase.start_with?(text.downcase) }
      @jobs = Job.all.select { |k| /#{text.downcase}/.match(k.title.downcase)  || /#{text.downcase}/.match(k.company.name.downcase)}
      render template: "users/job"
    else
      if session[:user_type] == "company"
        #@apps = Application.all.select { |k| k.student.name.downcase.start_with?(text.downcase) }
        @apps = Application.all.select { |k| /#{text.downcase}/.match(k.student.email.downcase) || /#{text.downcase}/.match(k.job.title.downcase) }
        render template: "users/app"
      else
        redirect_to :back
      end
    end
  end

  def accept
    app = params[:app_id]
    application = Application.find_by(:id => app)
    application.status = 1
    application.save
    redirect_to :back
    
  end

  def remove
    app = params[:app_id]
    application = Application.find_by(:id => app)
    Application.destroy(application)
    redirect_to :back
  end
end
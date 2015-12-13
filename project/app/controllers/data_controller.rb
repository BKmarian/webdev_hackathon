class DataController < ActionController::Base

	def jobs

		if session[:user_type] == nil
			@availaible_jobs = Job.all
		else
			@student_applications = Application.where( student_id: Student.find_by( :email => session[:user_account] ) )
			@availaible_jobs = Job.all.select{ |job| @student_applications.find_by( :job_id => job.id) == nil }
		end

		@jobs_ids = @availaible_jobs.map(&:id)
		@jobs_titles = @availaible_jobs.map(&:title)
		@companies_names = @availaible_jobs.map{ |this_job| ( (this_job.company != nil) ? this_job.company.name : nil) }

		render :json => @jobs_titles.zip( @companies_names , @jobs_ids )
	end

	def companies
		@companies_names = Company.all.map(&:name)
		@jobs = Company.all.map{ |company| if Job.find_by( :company_id => company.id ) then  Job.where( company_id: company.id).map(&:title)
											else [nil] end }
		render :json => @companies_names.zip( @jobs )
	end

	def availaibleSkills
		render :json => Skill.all.map(&:id).zip( Skill.all.map(&:name) )
	end

	def applications
		student = Student.find_by(:email => session[:user_account])
		@applications = Application.find_by(:student_id => student.id)
		render json: @applications
	end

	def setSearchWord
		session[:search_text] = params[:search_text]
		redirect_to '/'
	end

	def search

		@text = params[:search_text]

		if session[:user_account] == nil
			@availaible_jobs = Job.all
		else
			@student_applications = Application.where( student_id: Student.find_by( :email => session[:user_account] ) )
			@availaible_jobs = Job.all.select{ |job| @student_applications.find_by( :job_id => job.id) == nil }
		end

		@jobs_ids = @availaible_jobs.map(&:id)
		@jobs_titles = @availaible_jobs.map(&:title)
		@companies_names = @availaible_jobs.map{ |this_job| ( (this_job.company != nil) ? this_job.company.name : nil) }

		@all = @jobs_titles.zip( @companies_names , @jobs_ids )

		render :json => @all.select{ |job| ( (job[0].downcase.include? @text.downcase) || (job[1].downcase.include? @text.downcase) ) } 

	end

end
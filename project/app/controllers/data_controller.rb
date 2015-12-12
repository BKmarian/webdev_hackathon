class DataController < ActionController::Base

	def jobs
		@availaible_jobs = Job.all.select{ |job| (Application.find_by( :job_id => job.id ) != nil) ? 
			(Application.find_by( :job_id => job.id ).student_id != Student.find_by( :email => session[:user_account] ).id) : true }
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

<<<<<<< HEAD
	def availaibleSkills
		render :json => Skill.all.map(&:id).zip( Skill.all.map(&:name) )
	end

=======
	def applications
		student = Student.find_by(:email => session[:user_account])
		@applications = Application.find_by(:student_id => student.id)
		render json: @applications
	end
>>>>>>> 56e5d6fcbaad5faf1f45e97607811c91f97c528d
end
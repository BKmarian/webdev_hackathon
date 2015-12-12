class DataController < ActionController::Base

	def jobs
		@jobs_titles = Job.all.map(&:title)
		@companies_names = Job.all.map{ |this_job| this_job.company.name }

		render :json => @jobs_titles.zip( @companies_names )
	end

	def companies
		@companies_names = Company.all.map(&:name)
		@jobs = Company.all.map{ |company| if Job.find_by( :company_id => company.id ) then  Job.where( company_id: company.id).map(&:title)
											else [nil] end }
		render :json => @companies_names.zip( @jobs )
	end

end
Rails.application.routes.draw do

  post '/login' => 'login#authenticate'
  get '/logout' => 'login#destroy'
  post '/student_new' => 'users#studentnew'
  post '/company_new' => 'users#companynew'

  get '/getJobs' => 'data#jobs'
  get '/getCompanies' => 'data#companies'

  get '/allSkills' => 'data#availaibleSkills'

  get '/getApplications' => 'data#applications'
  post '/apply/:jobid' => 'users#createapplication'
  
  post '/search' => "data#search"

end
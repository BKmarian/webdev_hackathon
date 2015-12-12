Rails.application.routes.draw do
  get '/' => 'gif#cool'

  get '/login' => 'login#loginpage'
  post '/login' => 'login#authenticate'
  get '/logout' => 'login#destroy'
  post '/student_new' => 'users#studentnew'
  post '/company_new' => 'users#companynew'

  get '/cool' => 'gif#cool'

  get '/getJobs' => 'data#jobs'
  get '/getCompanies' => 'data#companies'
<<<<<<< HEAD
  get '/allSkills' => 'data#availaibleSkills'

=======
  get '/getApplications' => 'data#applications'
>>>>>>> 56e5d6fcbaad5faf1f45e97607811c91f97c528d
end

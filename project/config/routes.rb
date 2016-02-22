Rails.application.routes.draw do
  get '/app' => "users#app"
  get '/jobs' => "users#job"
  get '/findjobs' => 'login#loginpage'
  post '/login' => 'login#authenticate'
  get '/logout' => 'login#destroy'
  post '/signupstudent' => 'users#new_student'
  post '/signupcompany' => 'users#new_company'
  post '/search' => 'application#search'
  post '/apply/:job_id' => 'users#apply'
  post '/remove/:app_id' => 'application#remove'
  post '/accept/:app_id' => 'application#accept'
  post '/create_job' => 'users#new_job'
end

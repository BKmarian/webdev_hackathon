Rails.application.routes.draw do
  get '/' => 'login#loginpage'

  get '/app' => "users#app"
  get '/jobs' => "users#job"
  get '/login' => 'login#loginpage'
  post '/login' => 'login#authenticate'
  get '/logout' => 'login#destroy'

  post '/signupstudent' => 'users#new_student'
  post '/signupcompany' => 'users#new_company'
  post '/search' => 'application#search'
  post '/apply/:job_id' => 'users#apply'
  #post '/users' => 'users#create'

  get '/cool' => 'gif#cool'
end

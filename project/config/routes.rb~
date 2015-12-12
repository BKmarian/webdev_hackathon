Rails.application.routes.draw do
  get '/' => 'gif#cool'

  get '/login' => 'login#loginpage'
  post '/login' => 'login#authenticate'
  get '/logout' => 'login#destroy'

  get '/signupstudent' => 'users#new'
  get '/signupcompany' => 'users#new_company'
  post '/users' => 'users#create'

  get '/cool' => 'gif#cool'
end

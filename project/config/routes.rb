Rails.application.routes.draw do
  get '/' => 'gif#cool'

  get '/login' => 'login#new'
  get '/login' => 'login#new_company'
  post '/login' => 'login#create'
  get '/logout' => 'login#destroy'

  get '/signupstudent' => 'users#new'
  get '/signupcompany' => 'users#new_company'
  post '/users' => 'users#create'

  get '/cool' => 'gif#cool'
end

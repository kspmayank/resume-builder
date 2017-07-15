Rails.application.routes.draw do
  resources :user_resumes
  get 'session/new'

  root 'welcome#index'

  resources :users
  get '/login' => "session#new"
  post '/login' => "session#create"
  get '/logout' => "session#destroy"
  get '/signup' => "users#new"
  get '/templates' => "welcome#templates"
  get '/template1' => "welcome#template1"
  post '/user_resumes_ajax' => "user_resumes#ajaxhandle"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

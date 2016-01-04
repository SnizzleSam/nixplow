Rails.application.routes.draw do
  root 'users#index'

  resources :users 
  resources :owner_users, controller: 'users', type: 'OwnerUser', :path => "owners" do
    get '/jobs/new' => 'shovel_jobs#new'
    post '/jobs/new' => 'shovel_jobs#create'
  end
  
  resources :shovel_users, controller: 'users', type: 'ShovelUser', :path => "shovelers"
  get 'login'     => 'sessions#new'
  post 'login'    => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end

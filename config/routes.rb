Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
  }
  
  devise_scope :user do
    root "devise/sessions#new"
    get '/users/signin', to: 'devise/sessions#new'
    post '/users/signin', to: 'devise/sessions#create'
    delete 'users/signout', to: 'devise/sessions#destroy'
    get '/users/signup', to: 'devise/registrations#new'
    get 'users', to: 'devise/registrations#edit'
    patch 'users', to: 'devise/registrations#update'
    get 'users', to: 'devise/passwords#new'
    post 'users', to: 'devise/passwords#create'
    get 'users', to: 'devise/passwords#edit'
    put 'users', to: 'devise/passwords#update'
  
    namespace :user, path: "users", module: "users" do
      resources :articles
    end
  end
    

  get 'dash_boards', to: 'users#dash_boards' 
  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end

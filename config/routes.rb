Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
    
  get '/logon', :to => 'users#login'
  post '/login', :to => 'sessions#create'
  delete '/logout', :to => 'sessions#destroy'
  get 'tryouts/:quizz_id/:question_id', :to =>  "tryouts#show", :as => 'tryout'

  resources :questions
  resources :tryouts
  resources :quizzes
  resources :users

  root :to => 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

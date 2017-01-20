Rails.application.routes.draw do
  
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
    
  get '/logon', :to => 'users#login'
  post '/login', :to => 'sessions#create'
  delete '/logout', :to => 'sessions#destroy'
  get 'tryouts/:quizz_id/:token', :to =>  "tryouts#show", :as => 'tryout'

  resources :questions
  resources :quizzes,:only => [:index, :show, :new, :create]
  resources :users, :except => [:update, :edit, :destroy]
  resources :students, :only => [:new, :create]
  
  namespace :api, :defaults => {:format => :json} do
  namespace :v1 do
    get '/quizzes/:id/result', :to => 'quizzes#result', as: 'quiz_result'
    get '/quizzes/:id/participant', :to => 'quizzes#participant', as: 'quiz_participant'
    get '/quizzes/:id/:token', :to => 'quizzes#show'
    resources :quizzes, :only => [:index, :show, :update]
    resources :students, :only => [:index, :create, :destroy]
    end
  end

  root :to => 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
    
  get '/sign_in', :to => 'users#login'
  post '/login', :to => 'sessions#create'
  delete '/sign_out', :to => 'sessions#destroy'
  get 'tryouts/:quizz_id/:token', :to =>  "tryouts#show", :as => 'tryout'

  resources :questions, :except => [:index, :show]
  resources :quizzes,:only => [:index, :show, :new, :create]
  resources :users, :except => [:update, :edit, :destroy, :show]
  #resources :students, :only => [:create]
  
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

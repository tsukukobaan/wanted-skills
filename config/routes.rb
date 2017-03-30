Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only:[:index,:show,:edit,:update] do
    member do
      get :like_skills
    end
  end
  
  resources :skills, only: [:show, :create, :edit, :update, :destroy] do
    member do
      get :liking_users
    end
  end
  
  
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'

  post '/like/:skill_id' => 'likes#like', as:'like'
  delete '/unlike/:skill_id' => 'likes#unlike', as:'unlike'
  
end

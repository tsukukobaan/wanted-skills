Rails.application.routes.draw do
  resources :users
  get 'home/top'

  resources :skills
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#top'
  get '/about' => 'home#about'
end

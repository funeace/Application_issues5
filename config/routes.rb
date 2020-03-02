Rails.application.routes.draw do
  root "homes#top"
  get "home/about" => "homes#about"
  get "search" => "search#result"

  devise_for :users
  resources :books , only: [:index, :show, :edit, :create,  :update, :destroy]
  resources :users , only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

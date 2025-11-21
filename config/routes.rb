Rails.application.routes.draw do
  root to: "lists#index"
  
  resources :movies
  resources :lists, except: [:index] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
end

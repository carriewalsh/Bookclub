Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "welcome#index"

  resources :books, only: [:index, :show, :destroy] do
    resources :reviews, only: [:new, :create]
  end 
end

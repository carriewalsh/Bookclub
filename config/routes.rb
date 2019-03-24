Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "welcome#index"

  resources :users, only [:show]

  resources :books, only: [:index, :show, :destroy, :create, :new] do
    resources :reviews, only: [:new, :create]
  end

end

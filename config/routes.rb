Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "welcome#index"

  # original routes that have path_helpers
  resources :reviews, only: [:show, :destroy]

  resources :books, only: [:index, :show, :destroy, :create, :new] do
    resources :reviews, only: [:new, :create]
  end

  resources :authors, only: [:show, :destroy]

  # new - handrolled routes for prework practice
  # get "/reviews/:id", to: "reviews#show"
  # delete "/reviews/:id", to: "reviews#destroy"
  #
  # get "/books", to: "books#index"
  # get "/books/:id", to: "books#show"
  # delete "/books/:id", to: "books#destroy"
  # post "/books", to: "books#create"
  # get "/books/new", to: "books#new"
  #
  # get "/books/:book_id/reviews/new", to: "reviews#new"
  # post "/books/:book_id/reviews", to: "reviews#create"
  #
  # get "/authors/:id", to: "authors#show"
  # delete "/authors/:id", to: "authors#destroy"
end

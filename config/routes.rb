Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "welcome#index"
  # resources :reviews, only: [:show, :destroy]
  #
  # resources :books, only: [:index, :show, :destroy, :create, :new] do
  #   resources :reviews, only: [:new, :create]
  # end
  #
  # resources :authors, only: [:show, :destroy]
  #


  get '/authors/:id', to: 'authors#show', as: 'author'
  delete '/authors/:id', to: 'authors#destroy'

  get '/reviews/:id', to: 'reviews#show', as: 'review'
  delete '/reviews/:id', to: 'reviews#destroy'

  get '/books', to: 'books#index', as: 'books'
  post '/books', to: 'books#create'

  get '/books/new', to: 'books#new', as: 'new_book'

  get '/books/:id', to: 'books#show', as: 'book'
  delete '/books/:id', to: 'books#destroy'

  get '/books/:book_id/reviews/new', to: 'reviews#new', as: 'new_book_review'
  post '/books/:book_id/reviews', to: 'reviews#create', as: 'book_reviews'


end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get('/', to: "welcome#index")

  # get('/posts', to: "posts#index")
  # get('/posts/show/:id', to: "posts#show", as: :post)
  # get('/posts/new/', {to: "posts#new", as: :new_post})

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  get('/comments', to: "comments#show")
end

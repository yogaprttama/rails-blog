Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "pages#index"
  get 'blog/:slug', to: 'pages#show', format: false, as: :blog, constraints: { slug: /[a-z0-9]+(?:-[a-z0-9]+)*/ }

  # Admin Resources
  get 'posts/index'
  get 'posts/show'
  get 'posts/new', to: 'posts#new', as: :new_posts
  post 'posts/new', to: 'posts#create', as: :posts
  get 'posts/edit/:id', to: 'posts#edit', as: :edit_post
  patch 'posts/edit/:id', to: 'posts#update', as: :post
  patch 'posts/toggle/:id', to: 'posts#toggle_status', as: :toggle_post_status
end

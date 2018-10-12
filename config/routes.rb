Rails.application.routes.draw do
  root to: 'posts#index', as: 'home'

  get '/about' => 'pages#about', as: 'about'

  resources :posts
end

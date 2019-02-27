Rails.application.routes.draw do

  get 'pages/manual'
  get 'pages/responselist'
  resources :posts
  root 'posts#index'

  # Der posts redirect kann wie ein Formular Felder an den gemappten Controller übergeben
  #get "/posts/:wurst/:brot" => "posts#show" params[:wurst]

  root "home#index"
  get "/" => "posts#index"
  get 'pages/about' => "pages#about"
  get 'pages/home'
  get 'pages/contact'
  get 'manual' => 'pages#manual'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

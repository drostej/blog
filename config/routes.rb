Rails.application.routes.draw do

  get 'pages/manual'
  get 'pages/responselist'
  resources :posts
  root 'pages#home'

  get 'pages/about'
  get 'pages/home'
  get 'pages/contact'
  get 'manual' => 'pages#manual'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

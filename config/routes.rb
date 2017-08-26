Rails.application.routes.draw do
  resources :lists
  root 'home#index'
  get '*path' => 'home#index'
end

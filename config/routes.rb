Rails.application.routes.draw do
  resources :lists do
    post '/add_item' => 'lists#add_item'
  end
  root 'home#index'
  get '*path' => 'home#index'
end

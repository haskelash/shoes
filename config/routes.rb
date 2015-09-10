Shoes::Application.routes.draw do
  root to: 'users#new'
  post   'users'               => 'users#create'
  get    'login'                => 'users#new'
  post   'login'                => 'sessions#create'
  delete 'logout'               => 'sessions#destroy'
  get    'shoes'                => 'products#index'
  get    'dashboard'            => 'users#show'
  post   'products'             => 'products#create'
  post   'buy/:id'              => 'users#buy'
  delete 'products/destroy/:id' => 'products#destroy'
end

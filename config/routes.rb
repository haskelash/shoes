Shoes::Application.routes.draw do
  root to: 'users#new'
  resources :users, :products
  get    'login'                => 'users#new'
  post   'login'                => 'sessions#create'
  delete 'logout'               => 'sessions#destroy'
  get    'shoes'                => 'products#index'
  post   'buy/:id'              => 'users#buy'
  delete 'products/destroy/:id' => 'products#destroy'
end

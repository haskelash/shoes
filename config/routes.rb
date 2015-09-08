Shoes::Application.routes.draw do
  get "login/show"
  resources :users
end

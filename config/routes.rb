AwongTestLivingSocial::Application.routes.draw do
  resources :merchants
  resources :items
  resources :purchasers
  resources :purchases

  root :to => "purchases#new"
end

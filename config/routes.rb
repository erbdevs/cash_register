Rails.application.routes.draw do
  root to: 'welcome#index'

  get 'products', to: 'products#index'

  get 'basket', to: 'baskets#show'

  resources :basket_items
end

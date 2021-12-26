Rails.application.routes.draw do
  root to: 'welcome#index'

  get 'products', to: 'products#index'

  get 'basket', to: 'basket#show'

  resources :basket_items
end

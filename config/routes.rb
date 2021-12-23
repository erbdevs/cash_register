Rails.application.routes.draw do
  root to: 'welcome#index'

  get 'products/index'
  get 'basket/new'
  get 'basket/create'
end

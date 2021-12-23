Rails.application.routes.draw do
  root to: 'welcome#index'

  get 'products/index'

  get 'basket/show'

  get 'basket_items/create'
  get 'basket_items/update'
  get 'basket_items/destroy'
end

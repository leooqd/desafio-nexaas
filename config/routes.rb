Rails.application.routes.draw do

  resources :products, except: [:index]
  resources :stores, except: [:index]

  post  '/stock_items/update', to: 'stock_items#update', as: :stock_items_update
end

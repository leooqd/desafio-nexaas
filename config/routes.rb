Rails.application.routes.draw do

  resources :products
  resources :stores

  post  '/stock_items/update', to: 'stock_items#update', as: :stock_items_update
end

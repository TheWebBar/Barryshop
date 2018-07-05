Rails.application.routes.draw do
  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]
  get 'simple_pages/about', to: redirect('simple_pages/contact')
  get 'simple_pages/contact'
  get 'simple_pages/landing_page'
  get 'simple_pages/index'
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

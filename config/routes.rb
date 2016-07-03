Rails.application.routes.draw do
  # User authentication #
  devise_for :users

  # Static pages #
  get 'static_pages/index'

  # Categories #
  resources :categories
  
  # Root page #
  root 'static_pages#index'
end

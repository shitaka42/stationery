Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show

  resources :products, only: :show do
    resources :reviews,only: [:new, :create]
    collection do
      get 'search'
      get 'category'
    end
  end

  root 'products#index'
end

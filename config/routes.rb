Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show

  resources :products, only: :show do
    resources :genre_likes, only: :show do
      collection do
        post 'genre_like'
        delete 'genre_unlike'
      end
    end
    resources :reviews,only: [:new, :create]
    collection do
      get 'search'
      get 'category'
    end
  end

  root 'products#index'
end

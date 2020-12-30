Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :posts do
    collection do
      post :confirm
    end
    member do
      patch :confirm
    end
  end
end

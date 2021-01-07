Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/inbox" if Rails.env.development?
  resources :favorites, only: [:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :posts do
    collection do
      post :confirm
    end
    member do
      patch :confirm
    end
  end
end

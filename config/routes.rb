Rails.application.routes.draw do

  get 'relationships/create'
  get 'relationships/destroy'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users, only: [:index]
  resources :relationships, only: [:create, :destroy]
  resources :blogs do
    resources :comments
    post :confirm, on: :collection
  end
  resources :poems, only: [:index, :show]
  resources :contacts, only: [:new, :create] do
  collection do
      post :confirm
    end
  end

 root 'top#index'
end

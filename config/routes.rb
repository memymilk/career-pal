Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :videocalls, only: :show

  get "profile", to: "pages#profile", as: :profile

  resources :users do
    resources :videocalls, only: :show
  end

  resources :videocalls do
    resources :feedbacks, only: %i[new create]
  end


end

Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "profile", to: "pages#profile", as: :profile
  # get "feedback", to: "pages#feedback/:id"

  resources :users do
    resources :videocalls
  end

  resources :videocalls do
    resources :feedbacks, only: %i[new create]
  end


end

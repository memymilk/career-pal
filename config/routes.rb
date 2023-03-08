Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
<<<<<<< HEAD
  resources :videocalls, only: :show
=======

  get "profile", to: "pages#profile", as: :profile
  # get "feedback", to: "pages#feedback/:id"

  resources :users do
    resources :video_call
  end


  resources :video_call do
    resources :feedback, only: %i[new create show]
  end


>>>>>>> a56798053b9a21251747f34003d6e5b430712f96
end

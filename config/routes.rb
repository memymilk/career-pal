Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :users do
    resources :video_call
  end

  resources :video_call do
    resources :feedback, only: %i[new create]
  end

  get "profile", to: "pages#profile", as: :profile
end

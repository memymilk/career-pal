Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :users do
    resources :video_calls
  end

  resources :video_calls do
    resources :feedbacks, only: %i[new create]
  end

  get "profile", to: "pages#profile", as: :profile
end

Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :users do
    resources :feedback
  end
  get "profile", to: "pages#profile", as: :profile

end

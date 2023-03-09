Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "profile", to: "pages#profile", as: :profile
  get "profile/education", to: "pages#show_education", as: :show_education
  get "profile/edit_education", to: "pages#edit_education", as: :edit_profile_education
  patch "education", to: "pages#update_education", as: :update_profile_education
  # get "feedback", to: "pages#feedback/:id"

  resources :users do
    resources :videocalls
  end

  resources :videocalls do
    resources :feedbacks, only: %i[new create]
  end


end

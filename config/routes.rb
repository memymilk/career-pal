Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :videocalls, only: :show

  get "profile", to: "pages#profile", as: :profile
  get "instructions", to: "pages#instructions", as: :instructions

  # education editing below
  get "profile/education", to: "pages#show_education", as: :show_education
  get "profile/edit_education", to: "pages#edit_education", as: :edit_profile_education
  patch "education", to: "pages#update_education", as: :update_profile_education

  #work_experience editing below
  get "profile/work_experience", to: "pages#show_work_experience", as: :show_work_experience
  get "profile/edit_work_experience", to: "pages#edit_work_experience", as: :edit_profile_work_experience
  patch "work_experience", to: "pages#update_work_experience", as: :update_profile_work_experience

  #extra_info editing below
  get "profile/extra_info", to: "pages#show_extra_info", as: :show_extra_info
  get "profile/edit_extra_info", to: "pages#edit_extra_info", as: :edit_profile_extra_info
  patch "extra_info", to: "pages#update_extra_info", as: :update_profile_extra_info

  #first_name editing below
  get "profile/first_name", to: "pages#show_first_name", as: :show_first_name
  get "profile/edit_first_name", to: "pages#edit_first_name", as: :edit_profile_first_name
  patch "first_name", to: "pages#update_first_name", as: :update_profile_first_name

  # get "feedback", to: "pages#feedback/:id"


  resources :users do
    resources :videocalls, only: :show
  end

  resources :videocalls, only: %i[show] do
    resources :feedbacks, only: %i[new create show]
  end

  get "new_videocall", to: "videocalls#assign_to_call", as: :new_videocall

end

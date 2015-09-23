Rails.application.routes.draw do


  get 'user_selected_topics/create'

  get 'pages/home'
  get 'groups/:group_id/invites' => 'groups#invites'
  post 'user_selected_topics/create' => 'user_selected_topics#create'

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  namespace :api do
    namespace :v1 do
      post 'login' => 'login#login'
    end
  end
  # You can have the root of your site routed with "root"
  root 'pages#home'
  resources :hours
  namespace :api do
    namespace :v1 do
      resources :groups do
        resources :topics
        resources :availabilities
        resources :potential_pairs
      end
    end
  end

resources :groups do
  resources :topics
  resources :availabilities
  resources :potential_pairs
end
end
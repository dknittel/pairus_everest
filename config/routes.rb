Rails.application.routes.draw do

  get 'user_selected_topics/create'

  get 'pages/home'
  get 'groups/:group_id/invites' => 'groups#invites'
  post 'user_selected_topics/create' => 'user_selected_topics#create'

  devise_for :users

  # You can have the root of your site routed with "root"
  root 'pages#home'
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :hours
      end
      resources :groups do
        resources :topics
        resources :availabilities
        resources :potential_pairs
      end
    end
  end

  resources :hours
  resources :groups do
    resources :topics
    resources :availabilities
    resources :potential_pairs
  end
end

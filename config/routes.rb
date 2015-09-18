Rails.application.routes.draw do
  get 'potential_pairings/index'

  get 'potential_pairings/show'

  get 'potential_pairings/new'

  get 'potential_pairings/create'

  get 'potential_pairings/edit'

  get 'potential_pairings/update'

  get 'potential_pairings/destroy'

  get 'availabilities/new'

  get 'availabilities/create'

  get 'availabilities/edit'

  get 'availabilities/update'

  get 'availabilities/destroy'

  get 'hours/new'

  get 'hours/create'

  get 'hours/edit'

  get 'hours/update'

  get 'hours/destroy'

  get 'schedules/show'

  get 'schedules/new'

  get 'schedules/create'

  get 'schedules/edit'

  get 'schedules/update'

  get 'schedules/destroy'

  get 'topics/index'

  get 'topics/show'

  get 'topics/new'

  get 'topics/create'

  get 'topics/destroy'

  get 'groups/create'

  get 'groups/update'

  get 'groups/destroy'

  get 'groups/show'

  get 'groups/new'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

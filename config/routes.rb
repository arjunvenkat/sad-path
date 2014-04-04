SadpathVer2::Application.routes.draw do
  resources :topics do
    get "/set_current" => "topics#set_current"
  end
  resources :check_list_items
  resources :course_check_lists
  resources :check_lists
  resources :roadblock_checks
  resources :checks
  resources :enrollments
  resources :courses
  resources :roadblocks
  get '/roadblocks/:id/need-help' => 'roadblocks#need_help'
  get '/roadblocks/:id/solved-it' => 'roadblocks#solved_it'
  get '/roadblocks/:id/not-solved' => 'roadblocks#not_solved'
  post 'roadblocks/:id/add-sol' => 'roadblocks#add_sol'
  resources :users

  get "/login" => "sessions#new"
  post "sessions/create" => "sessions#create"
  delete "logout" => "sessions#destroy"
  root 'pages#stuck'
  get 'stuck' => 'pages#stuck'
  get '/move-on' => 'pages#move_on'
  get '/enroll/:enrollment_hash' => 'pages#enroll'
  get '/error' => 'pages#error'
  get "/longlist" => "roadblocks#longlist"
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

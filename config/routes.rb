Rails.application.routes.draw do
  devise_for :users
  # get 'home/index'
  root 'movies#index'

  post 'register/user_creation' => 'home#register_new_user', as: :registration_form
  get 'register/user' => 'home#register', as: :new_user_registration_path
  get 'user/login' => 'home#login', as: :new_user_session_path

  get 'movies' => 'movies#index'
  get 'movies/:id' => 'movies#screens', as: :movie_screens_path
  get 'booking/:id' => 'ticket#booking', as: :booking_path
  post 'booking/:id' => 'ticket#book_ticket', as: :book_ticket_path
  get 'booking/cancel/:id' => 'ticket#cancel_ticket', as: :cancel_booking

  get 'user/bookings' => 'home#bookings', as: :user_bookings

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

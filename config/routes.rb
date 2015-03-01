
Rails.application.routes.draw do
  root :to => "graph#index"


	namespace :v1 do
		match '/user/:id/:auth_token', to: 'user#show', via: :get, :constraints => { :auth_token => /[0-9A-Za-z\-\.]+/ }
		match '/user/', to: 'user#destroy', via: :delete, :constraints => { :auth_token => /[0-9A-Za-z\-\.]+/ }
		match '/user/', to: 'user#update', via: :put, :constraints => { :auth_token => /[0-9A-Za-z\-\.]+/ }
		match '/user', to: 'user#create', via: :post

		match '/charities/:admin_token', to: 'charity#index', via: :get, :constraints => { :admin_token => /[0-9A-Za-z\-\.]+/ }
		match '/charities/:admin_token', to: 'charity#create', via: :post, :constraints => { :admin_token => /[0-9A-Za-z\-\.]+/ }
		match '/charity/:id/:admin_token', to: 'charity#show', via: :get, :constraints => { :admin_token => /[0-9A-Za-z\-\.]+/ }
		match '/charity/:id/:admin_token', to: 'charity#update', via: :update, :constraints => { :admin_token => /[0-9A-Za-z\-\.]+/ }
		match '/charity/:id/:admin_token', to: 'charity#destroy', via: :delete, :constraints => { :admin_token => /[0-9A-Za-z\-\.]+/ }

		match '/run', to:'post#runParser', via: :get
	end
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

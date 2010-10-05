Qwf::Application.routes.draw do
  match 'admin' => 'admin/books#index'
  match '' => 'index#index'
  match '/index/auto_complete_for_book_title' => 'books#auto_complete_for_book_title'
  match '/index/auto_complete_for_author_name' => 'authors#auto_complete_for_author_name'
  match 'books/genre/:genre' => 'books#genre', :genre => /\D+/
  match 'awards/year/:year' => 'awards#year', :year => /\d+/
  match '/awards/category/:category' => 'awards#category', :category => /\D+/
  match '/admin/login/login_form' => 'admin/login#login_form'  
  match '/admin/login/login' => 'admin/login#login'
  match ':controller/service.wsdl' => '#wsdl'
  match '/admin/authors(/:action(/:id))' => '/admin/authors'
  match '/admin/books(/:action(/:id))' => '/admin/books'
  match '/admin/publishers(/:action(/:id))' => '/admin/publishers'  
  match '/:controller(/:action(/:id))'


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

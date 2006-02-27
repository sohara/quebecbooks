ActionController::Routing::Routes.draw do |map|
  # Add your own custom routes here.
  # The priority is based upon order of creation: first created -> highest priority.
  
  # Here's a sample route:
  # map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # You can have the root of your site routed by hooking up '' 
  # -- just remember to delete public/index.html.
   map.connect 'admin', :controller => "admin/books"
   map.connect '', :controller => "index"

  # Map genres to genre controller
  map.connect "books/genre/:genre",
              :controller => "books",
              :action => "genre",
              :genre => /\D+/
              
  # Map award years to year action of awards controller
  map.connect "awards/:year",
              :controller => "awards",
              :action => "year",
              :year => /\d+/
              
  # Allow downloading Web Service WSDL as a file with an extension
  # instead of a file named 'wsdl'
  map.connect ':controller/service.wsdl', :action => 'wsdl'

  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id'
end

ActionController::Routing::Routes.draw do |map|
	map.root :controller => "home"
	map.admin  '/admin', :controller => 'admin', :action => 'index'
	map.connect ':controller/:action/:id.:format'
	map.connect ':controller/:action/:id'
	map.connect ':controller/:action/'
end

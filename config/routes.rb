ActionController::Routing::Routes.draw do |map|
	map.root :controller => "home"
	map.admin  '/admin', :controller => 'admin', :action => 'index'
end

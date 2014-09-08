Rails.application.routes.draw do
  	namespace :mercury do
      resources :images
    end
    
	put 'editable' => 'editable_content/editables#update'
	
	mount Mercury::Engine => '/'
end
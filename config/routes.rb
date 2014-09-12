Rails.application.routes.draw do
  	namespace :mercury do
      resources :images
    end
    
	put 'editable' => 'editable_content/editables#update'
	
	scope '/mercury' do
		get ':type/:resource' => "mercury#resource"
	end
	mount Mercury::Engine => '/'
end
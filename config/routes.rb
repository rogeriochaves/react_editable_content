Rails.application.routes.draw do
	namespace :editable_content do
  		resources :editables
  	end
end
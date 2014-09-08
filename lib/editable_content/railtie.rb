module EditableContent
  class Railtie < Rails::Railtie
	initializer "editable_content.view_helpers" do
		ActiveSupport.on_load(:action_view) do
			#puts "Extending ActionView::Helpers with EditableContent::EditablesHelpers"
      		ActionView::Helpers.send :include, EditableContent::EditablesHelper
      	end
    end
  end
end
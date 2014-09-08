module EditableContent
	class EditablesController < ::ApplicationController
		before_filter :can_change_editable_content?

		def update
			@editable = Editable.find_by_key params[:id]
			if editable_params[:return_to]
				@editable.update_attributes(editable_params)
				redirect_to editable_params[:return_to]
			else
				@editable.update_attribute(:text, editable_params[:text])
				render :json => {status: "ok"}
			end
		end

		private 
	    def editable_params
	        params.require(:editable).permit(:key, :text, :size, :picture, :return_to)
	    end
	end
end
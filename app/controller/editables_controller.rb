class EditablesController < ApplicationController
	before_filter :can_change_editable_content?

	def update
		@editable = Editable.find_by_key params[:id]
		if params[:text]
			@editable.update_attribute(:text, params[:text])
			render :json => {status: "ok"}
		else
			@editable.update_attributes(params[:editable])
			redirect_to params[:return_to]
		end
	end
end
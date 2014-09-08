module EditableContent
	class EditablesController < ::ApplicationController
		include Mercury::Authentication

		def update
			if can_edit?
				params[:content].each do |key, value|
					editable = Editable.find_by_key key
					if value[:type] == "image" and !value[:attributes][:src].start_with?("/assets")
						editable.update_attribute(:src, value[:attributes][:src])
					else
						editable.update_attribute(:text, value[:value])
					end
				end
				render json: {status: "ok"}
			else
				render nothing: true, status: :unauthorized
			end
		end
	end
end
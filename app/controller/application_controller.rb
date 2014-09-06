class ApplicationController < ActionController::Base
	helper_method :can_change_editable_content?

	def can_change_editable_content?
		return true
	end
end
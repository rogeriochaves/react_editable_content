module EditableContent
	module ApplicationController
		def self.included(base)
			base.send(:helper_method, :can_change_editable_content?)
		end

		def can_change_editable_content?
			return true
		end
	end
end
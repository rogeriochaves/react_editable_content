module EditableContent
	class Editable < ActiveRecord::Base
		self.table_name = "editable_content_editables"
	  	validates_uniqueness_of :key
	end
end
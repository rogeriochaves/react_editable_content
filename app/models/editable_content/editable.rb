module EditableContent
	class Editable < ActiveRecord::Base
	  validates_uniqueness_of :key
	  attr_accessor :size, :return_to
	  has_attached_file :picture, :styles => lambda { |editable| { :small => editable.instance.size } }
	  validates_attachment_content_type :picture, :content_type => %w(image/jpeg image/jpg image/png image/gif)
	end
end
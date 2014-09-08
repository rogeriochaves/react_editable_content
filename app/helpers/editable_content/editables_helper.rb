module EditableContent::EditablesHelper
	extend ApplicationHelper

	def editable_content(name = nil, &block)
		contents = capture(&block)
		key = Digest::MD5.hexdigest(name ? name : contents)
		e = ::EditableContent::Editable.find_by_key(key) || ::EditableContent::Editable.create(:key => key, :text => contents)
		contents = e.text if !e.text.empty?

		if can_change_editable_content?
			return content_tag(:div, contents.html_safe, 'data-editable' => key) 
		else
			return contents.html_safe
		end
	end

	def editable_image_tag(src, *args)
		options = args.extract_options!
		size = options[:size]
		if !size
			raise "The attribute :size must be specified on editable_image_tag"
		end
		key = Digest::MD5.hexdigest(src)
		if @editable = ::EditableContent::Editable.where(:key => key).first
			@editable.size = size
			src = @editable.picture.url(:small) if @editable.picture?
		else
			@editable = ::EditableContent::Editable.create(:key => key)
		end

		if can_change_editable_content?
			form = form_for(@editable, url: {controller: '/editable_content/editables', action: :update, id: key}, html: {multipart: true, method: :put, style: "display:inline", onmouseover: "this.children[4].style.display = \"block\"; this.children[5].style.display = \"block\"", onmouseout: "this.children[4].style.display = \"none\"; this.children[5].style.display = \"none\""}) do |f|
				f.hidden_field(:return_to, value: request.url)
				f.hidden_field(:size, value: size)
				f.file_field(:picture, style: "position:absolute; display:none;")
				f.submit('Ok', style: "position:absolute; display:none; margin-top:30px;")
				image_tag(src, options)
			end
			content_tag(:div, form, 'data-img-editable' => key) 
		else
			image_tag(src, options) 
		end
		
	end

end
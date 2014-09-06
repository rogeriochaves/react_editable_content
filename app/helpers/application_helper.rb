module ApplicationHelper

	# Editable Content
	def editable_content(name = nil, &block)
		contents = capture(&block)
		key = Digest::MD5.hexdigest(name ? name : contents)
		e = Editable.find_by_key(key) || Editable.create(:key => key, :text => contents)
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
		if @editable = Editable.where(:key => key).first
			@editable.size = size
			src = @editable.picture.url(:small) if @editable.picture?
		else
			@editable = Editable.create(:key => key)
		end

		if can_change_editable_content?
			form = "
				<form enctype='multipart/form-data' action='#{url_for :controller => '/editables', :action => :update, :id => key}' method='post' style='display:inline' onmouseover='this.children[4].style.display = \"block\"; this.children[5].style.display = \"block\"' onmouseout='this.children[4].style.display = \"none\"; this.children[5].style.display = \"none\"'>
					<input name='_method' type='hidden' value='put' />
					<input name='authenticity_token' type='hidden' value='#{form_authenticity_token}' />
					<input name='return_to' type='hidden' value='#{request.url}' />
					<input id='editable_size' name='editable[size]' type='hidden' value='#{size}#' />
					<input id='editable_picture' name='editable[picture]' type='file' style='position:absolute; display:none' />
					<input type='submit' value='Ok' style='position:absolute; display:none; margin-top:30px' />
					#{image_tag(src, options)}
				</form>
			".html_safe
			content_tag(:div, form, 'data-img-editable' => key) 
		else
			image_tag(src, options) 
		end
		
	end

end
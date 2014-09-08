# encoding: utf-8
require 'test_helper'

class EditablesHelperTest < ActionView::TestCase
	include ApplicationHelper

	fixtures :editables
  	set_fixture_class :editables => EditableContent::Editable

	setup do
		self.stubs(:can_change_editable_content?).returns(true)
		request = mock('request')
    	request.stubs(:url).returns('/test')
		self.stubs(:request).returns(request)
	end

	# Editable Text
	test "should create new editable for new key, and use the existent for existent ones" do
		assert_difference('EditableContent::Editable.count') do
			a = editable_content do
				"test 1"
			end
		end
		assert_difference('EditableContent::Editable.count', 0) do
			editable_content do
				"test 1"
			end
		end
		assert_difference('EditableContent::Editable.count') do
			editable_content('test 2') do
				"test 2"
			end
		end
		assert_difference('EditableContent::Editable.count', 0) do
			editable_content('test 2') do
				"test 2"
			end
		end
	end

	test "should render only text for not allowed users" do
		self.stubs(:can_change_editable_content?).returns(false)
		editable = editable_content do
			"text test"
		end
		assert_equal "text test", editable
	end

	test "should render editable content to alowed logged users" do
		editable = editable_content do
			"text test"
		end
		assert_match /data-editable/, editable
	end

	# Editable Images
	test "editable_image_tag without size should raise an error" do
		assert_raises(RuntimeError) { editable_image_tag "rails.png" }
	end

	test "should create new editable image for new key, and use the existent for existent ones" do
		assert_difference('EditableContent::Editable.count') do
			editable_image_tag "test1.png", :size => "50x50"
		end
		assert_difference('EditableContent::Editable.count', 0) do
			editable_image_tag "test1.png", :size => "50x50"
		end
	end

	test "should render only img for not allowed users" do
		self.stubs(:can_change_editable_content?).returns(false)
		assert_equal "<img alt=\"Rails\" height=\"50\" src=\"/images/rails.png\" width=\"50\" />", editable_image_tag("rails.png", :size => "50x50")
	end

	test "should render editable image to allowed users" do
		assert_match /data-img-editable/, editable_image_tag("rails.png", :size => "50x50")
	end
end
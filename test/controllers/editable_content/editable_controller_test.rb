# encoding: utf-8
require 'test_helper'

class EditableContent::EditablesControllerTest < ActionController::TestCase
  fixtures :editables
  set_fixture_class :editables => EditableContent::Editable

  setup do
    @editable = editables(:one)
  end

  test "should update editable text" do
    put :update, :id => @editable.key, :editable => { :text => "teste" }

    assert_equal "ok", JSON.parse(@response.body)['status']
  end

  test "should update editable image" do
    put :update, :id => @editable.key, :editable => { return_to: "teste", key: @editable.key, text: @editable.text, :size => '100x100', picture: fixture_file_upload('rails.png', 'image/png')  }

    assert_redirected_to "teste"
  end

end
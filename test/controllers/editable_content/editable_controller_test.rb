require 'test_helper'

class EditableContent::EditablesControllerTest < ActionController::TestCase
  fixtures :editables
  set_fixture_class :editables => EditableContent::Editable

  setup do
    @editable = editables(:one)
  end

  test "should update editable text" do
    content = {}
    content[@editable.key] = {value: "teste"}
    put :update, content: content

    assert_equal "ok", JSON.parse(@response.body)['status']
  end

  test "should update editable image" do
    content = {}
    content[@editable.key] = {type: "image", attributes: {src: "teste"}}
    put :update, content: content

    assert_equal "ok", JSON.parse(@response.body)['status']
  end

  test "should not be able to update image if unauthorized" do
    EditableContent::EditablesController.any_instance.stubs(:can_edit?).returns(false)

    content = {}
    content[@editable.key] = {value: "teste"}
    put :update, content: content

    assert_response 401
  end

end
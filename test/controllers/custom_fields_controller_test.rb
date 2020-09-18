require 'test_helper'

class CustomFieldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @custom_field = custom_fields(:one)
  end

  test "should get index" do
    get custom_fields_url
    assert_response :success
  end

  test "should get new" do
    get new_custom_field_url
    assert_response :success
  end

  test "should create custom_field" do
    assert_difference('CustomField.count') do
      post custom_fields_url, params: { custom_field: {  } }
    end

    assert_redirected_to custom_field_url(CustomField.last)
  end

  test "should show custom_field" do
    get custom_field_url(@custom_field)
    assert_response :success
  end

  test "should get edit" do
    get edit_custom_field_url(@custom_field)
    assert_response :success
  end

  test "should update custom_field" do
    patch custom_field_url(@custom_field), params: { custom_field: {  } }
    assert_redirected_to custom_field_url(@custom_field)
  end

  test "should destroy custom_field" do
    assert_difference('CustomField.count', -1) do
      delete custom_field_url(@custom_field)
    end

    assert_redirected_to custom_fields_url
  end
end

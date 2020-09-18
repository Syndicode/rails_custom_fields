module CustomFieldsHelper
  def custom_field_input(form, custom_field)
    case custom_field.field_type
    when /text/
      form.text_field custom_field.internal_name, id: custom_field.internal_name
    when /number/
      form.number_field custom_field.internal_name, id: custom_field.internal_name
    end
  end
end

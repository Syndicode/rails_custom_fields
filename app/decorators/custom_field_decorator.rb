class CustomFieldDecorator < SimpleDelegator
  def initialize(object)
    super
    init_custom_accessors
  end

  protected

  def init_custom_accessors
    fields = shop.custom_fields.pluck(:internal_name)
    return if fields.empty?

    __getobj__.singleton_class.class_eval do
      store_accessor :custom_fields, *fields
    end
  end
end

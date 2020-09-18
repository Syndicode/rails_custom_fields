class CustomField < ApplicationRecord
  belongs_to :shop, dependent: :destroy
  validates :label, :internal_name, :field_type, presence: true
  before_validation :parameterize_internal_name

  enum field_type: {
    text: 0,
    number: 1
  }

  def parameterize_internal_name
    return if internal_name.blank?

    self.internal_name = internal_name.parameterize(separator: '_').underscore
  end
end

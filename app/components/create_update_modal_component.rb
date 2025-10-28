# frozen_string_literal: true

class CreateUpdateModalComponent < ViewComponent::Base
  def initialize(record:, title: nil, layout: nil, icon: nil, url: nil, turbo: true, nested: false, data: nil)
    @record = record
    @title = title
    @layout = layout
    @icon = icon
    @url = url
    @nested = nested ? { controller: "nested-form", nested_form_wrapper_selector_value: ".nested-form-wrapper" } : nil
    @turbo = turbo ? { turbo: true } : nil
    @data = data || set_data_attrs
    super()
  end

  private

  def set_data_attrs
    data_attrs = {}
    data_attrs.merge!(@turbo) if @turbo
    data_attrs.merge!(@nested) if @nested
    data_attrs
  end
end

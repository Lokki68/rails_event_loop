# frozen_string_literal: true

class CreateStreamComponent < ViewComponent::Base
  def initialize(record:, records: nil, layout: nil, modal: true, partial: nil, tabs: {}, url: nil, success_flash: nil, particular: nil)
    @record = record
    @records = records
    @layout = layout
    @modal = modal
    @partial = partial
    @tabs = tabs.is_a?(Array) ? tabs.to_h { |tab| [ tab, tab ] } : tabs
    @url = url
    @success_flash = success_flash
    @particular = particular
  end
end

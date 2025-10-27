# frozen_string_literal: true

class PageComponent < ViewComponent::Base
  renders_many :panels

  def initialize(record:, layout:)
    @record = record
    @layout = layout
  end
end

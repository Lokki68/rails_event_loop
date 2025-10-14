# frozen_string_literal: true

class LinkIconComponent < ViewComponent::Base
  def initialize(icon:, href:)
    @icon = icon
    @href = href
  end
end

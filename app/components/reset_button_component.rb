# frozen_string_literal: true

class ResetButtonComponent < ViewComponent::Base
  def initialize(href:)
    @href = href
  end
end

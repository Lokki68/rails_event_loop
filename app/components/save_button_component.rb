# frozen_string_literal: true

class SaveButtonComponent < ViewComponent::Base
  def initialize(label:)
    @label = label
    super()
  end
end

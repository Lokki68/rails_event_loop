# frozen_string_literal: true

class ContactStatusComponent < ViewComponent::Base
  def initialize(status:, text:)
    @status = status
    @color = set_color(status)
    @text = text
  end

  private

  def set_color(status)
    if status == "accepted"
      "bg-success text-success-content"
    elsif status == "rejected"
      "bg-error text-error-content"
    else
      "bg-warning text-warning-content"
    end
  end
end

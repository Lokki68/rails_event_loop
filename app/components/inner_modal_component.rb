# frozen_string_literal: true

class InnerModalComponent < ViewComponent::Base
  renders_many :headers
  renders_many :columns
  renders_one :footer

  def initialize(reset:)
    @reset = reset
  end
end

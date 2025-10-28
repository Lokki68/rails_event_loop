# frozen_string_literal: true

class ModalComponent < ViewComponent::Base
  renders_one :icon
  renders_one :title
  renders_one :body

  def initialize(id: "modal")
    @id = id

    super()
  end
end

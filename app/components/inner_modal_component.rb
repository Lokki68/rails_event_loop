# frozen_string_literal: true

class InnerModalComponent < ViewComponent::Base
  renders_many :headers
  renders_many :columns
  renders_one :footer

  def initialize(reset:, submit_label: "Enregistrer")
    @reset = reset
    @submit_label = submit_label
    super()
  end
end

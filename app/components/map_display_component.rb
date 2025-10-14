# frozen_string_literal: true

class MapDisplayComponent < ViewComponent::Base
  def initialize(latitude:, longitude:)
    @latitude = latitude
    @longitude = longitude
  end
end

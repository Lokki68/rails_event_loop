class Event < ApplicationRecord
  belongs_to :created_by, class_name: "User"

  validates :title, :description, :date, :address, presence: true
end

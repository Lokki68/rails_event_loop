class Participant < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :user_id, uniqueness: { scope: :event_id, message: "est déjà inscrit sur cet evenement" }
end

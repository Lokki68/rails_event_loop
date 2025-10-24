class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :contact, class_name: "User"

  validates :user_id, uniqueness: { scope: :contact_id }

  after_create :send_request, if: :initial_request?

  after_destroy :destroy_inverse

  state_machine :accepted, initial: :waited do
    state :accepted
    state :rejected

    event :accept do
      transition waited: :accepted
    end

    event :reject do
      transition waited: :rejected
    end

    after_transition any => :accepted, do: :create_inverse
  end

  def send_request
    ContactMailer.contact_request(contact, user, id).deliver_now
  end

  def create_inverse
    unless Contact.exists?(user_id: contact_id, contact_id: user_id)
      Contact.create(
        user_id: contact_id,
        contact_id: user_id,
        accepted: "accepted",
      )
    end
  end

  def destroy_inverse
    inverse = Contact.find_by(user_id: contact_id, contact_id: user_id)
    inverse&.destroy
  end

  private

  def initial_request?
    accepted == "waited"
  end
end

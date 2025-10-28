class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :contacts
  has_many :contact_users, through: :contacts, source: :contact

  has_many :inverse_contacts, class_name: "Contact", foreign_key: "contact_id"
  has_many :inverse_contact_users, through: :inverse_contacts, source: :user

  has_many :participants, dependent: :destroy
  has_many :events, through: :participants

  def self.ransackable_attributes(auth_object = nil)
    [ "address", "birthday", "created_at", "email", "encrypted_password", "first_name", "id", "id_value", "last_name", "phone_number", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at", "username" ]
  end
end

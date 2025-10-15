class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :contacts
  has_many :contact_users, through: :contacts, source: :contact

  has_many :inverse_contacts, class_name: "Contact", foreign_key: "contact_id"
  has_many :inverse_contact_users, through: :inverse_contacts, source: :user


  def self.ransackable_attribute(_auth_object = nil)
    %w[username]
  end
end

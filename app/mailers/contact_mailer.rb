class ContactMailer < ApplicationMailer
  default from: "notification_event_loop@email.com"
  layout "mailer"

  def contact_request(contact, user, contact_id)
    @user = user
    @contact = contact
    @accept_url = accept_app_contact_url(contact_id)
    @reject_url = reject_app_contact_url(contact_id)

    mail to: @contact.email, subject: "Demande de contact - de : #{@user.username}"
  end
end

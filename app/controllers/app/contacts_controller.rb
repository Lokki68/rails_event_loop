
module App
  class ContactsController < AppController
    before_action :set_contact, only: %i[accept reject]

    def index
      @contact_requests = Contact.where(contact: current_user, accepted: "waited")
      @contacts = current_user.contacts
      @q = User.ransack(params[:q])
      @users = @q.result.where.not(id: current_user.id)

      console
    end


    def add_contact
      contact_user = User.find(params[:id])
      if current_user != contact_user && !current_user.contact_users.include?(contact_user)
        new_contact = Contact.create(
          user: current_user,
          contact: contact_user,
          accepted: "waited",
          requested_by: current_user
        )

        new_contact.send_request if new_contact.persisted?

        flash[:notice] = "Demande de contact envoyé à #{contact_user.username}"
      else
        flash[:alert] = "Ce contact est ajouté ou invalide."
      end

      redirect_back fallback_location: app_contacts_path
    end

    def accept
      if @contact.can_accept?
        @contact.accept
        flash[:notice] = "Demande de contact acceptée"
      else
        flash[:alert] = "Cette demande ne peut pas être accepté."
      end
      redirect_to app_contacts_path
    end

    def reject
      if @contact.can_reject?
        @contact.reject
        flash[:notice] = "Demande de contact rejetée"
      else
        flash[:alert] = "Cette demande ne peut pas être rejetée."
      end
      redirect_to app_contacts_path
    end


    def remove_contact
      contact_user = User.find(params[:id])

      contact = Contact.find_by(user: current_user, contact: contact_user)
      inverse = Contact.find_by(user: contact_user, contact: current_user)

      contact&.destroy
      inverse&.destroy

      flash[:info] = contact_user.username.present? ? "#{contact_user.username} a été retiré de vos contacts." : "Ce contact n'existe pas dans votre liste."
      redirect_back fallback_location: app_contacts_path
    end

    private

    def set_contact
      @contact = Contact.find(params[:id])
    end
  end
end

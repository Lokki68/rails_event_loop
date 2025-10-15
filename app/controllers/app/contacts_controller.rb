
module App
  class ContactsController < AppController
    def index
      @contacts = current_user.contact_users
      @q = User.ransack(params[:q])
      @users = @q.result.where.not(id: current_user.id)
    end


    def add_contact
      contact = User.find(params[:id])
      if current_user != contact && !current_user.contact_users.include?(contact)
        current_user.contact_users << contact
        flash[:notice] = "#{contact.email} a été ajouté à vos contacts."
      else
        flash[:alert] = "Ce contact est déjà ajouté ou invalide."
      end
      redirect_back fallback_location: app_contacts_path
    end


    def remove_contact
      contact = User.find(params[:id])
      if current_user.contact_users.include?(contact)
        current_user.contact_users.destroy(contact)
        flash[:info] = "#{contact.email} a été retiré de vos contacts."
      else
        flash[:alert] = "Ce contact n'existe pas dans votre liste."
      end
      redirect_back fallback_location: app_contacts_path
    end
  end
end

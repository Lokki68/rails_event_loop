Rails.application.routes.draw do
  devise_for :users

  namespace :app do
    resources :events
    resources :contacts do
      member do
        post :add_contact
        delete :remove_contact
      end
    end
  end

  root "dashboard#index"
end

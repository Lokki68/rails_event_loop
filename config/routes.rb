Rails.application.routes.draw do
  devise_for :users

  namespace :app do
    resources :events
  end

  root "dashboard#index"
end

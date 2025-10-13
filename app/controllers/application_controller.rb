class ApplicationController < ActionController::Base
  layout :set_layout

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  private

  def set_layout
    return "devise" if devise_controller?

    "application"
  end
end

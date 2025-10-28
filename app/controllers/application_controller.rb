class ApplicationController < ActionController::Base
  before_action :set_crud_model_class

  layout :set_layout


  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  private

  def set_layout
    return "devise" if devise_controller?

    "application"
  end

  def set_crud_model_class
    @crud_model_class = controller_name.classify.safe_constantize
  end
end

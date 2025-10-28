# frozen_string_literal: true

module TurboStreamActionsHelper
  def turbo_flash(text:, klass:, position: nil)
    turbo_stream_action_tag :flash, text:, klass:, position:
  end

  def hide_modal_form
    turbo_stream_action_tag :hide_modal_form
  end

  def show_modal_form
    turbo_stream_action_tag :show_modal_form
  end

  def remove_with_animation(target, animation: "animate__fadeOut", remove_delay: 1000)
    turbo_stream_action_tag :remove_with_animation, target:, animation:, remove_delay:
  end

  def remove_elements_with_animation(targets, animation: "animate__fadeOut", remove_delay: 1000)
    turbo_stream_action_tag :remove_elements_with_animation, targets:, animation:, remove_delay:
  end
end

Turbo::Streams::TagBuilder.prepend(TurboStreamActionsHelper)

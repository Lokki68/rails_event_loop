import { StreamActions } from "@hotwired/turbo";
import Notify from "simple-notify";

StreamActions.flash = function () {
  return new Notify({
    customClass:
      this.getAttribute("klass") === "success"
        ? "custom-success"
        : "custom-notify",
    status: this.getAttribute("klass"),
    title: this.getAttribute("text"),
    effect: "fade",
    speed: 300,
    showCloseButton: true,
    autoclose: true,
    autotimeout: 10000,
    position: "right bottom",
  });
};

StreamActions.hide_modal_form = () => {
  // window.currentModalForm.hide()
  document.querySelectorAll("#modal_form").forEach((element) => {
    element.replaceChildren();
  });
};

StreamActions.remove_with_animation = function () {
  const target = this.getAttribute("target");
  const animationClass = this.getAttribute("animation");
  // animateCss default anim duration is 1sec
  const removeDelay = this.getAttribute("remove_delay");
  const element = document.getElementById(target);
  element.classList.add("animate__animated", animationClass);
  setTimeout(() => {
    element.remove();
  }, removeDelay);
};

StreamActions.remove_elements_with_animation = function () {
  const elements = document.querySelectorAll(this.getAttribute("targets"));
  const animationClass = this.getAttribute("animation");
  // animateCss default anim duration is 1sec
  const removeDelay = this.getAttribute("remove_delay");
  elements.forEach((element) => {
    element.classList.add("animate__animated", animationClass);
    setTimeout(() => {
      element.remove();
    }, removeDelay);
  });
};

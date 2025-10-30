import "@hotwired/turbo-rails";
import "./controllers";
import "./turbo_stream_custom_actions"

import "leaflet/dist/leaflet.css";

document.addEventListener("turbo:load", (event) => {
  console.log('Turbo frame load')

  document.addEventListener("turbo:frame-load", (event) => {
    const fieldTypeSelect = document.querySelector("#modal_form_body #new_custom_field select#custom_field_field_type");
    if (fieldTypeSelect) {
      const possibleValuesInput = document.querySelector("#modal_form_body #new_custom_field textarea#custom_field_possible_values");
      if (possibleValuesInput) {
        fieldTypeSelect.addEventListener("change", (e) => {
          const label = fieldTypeSelect.querySelector("option[selected]").textContent;
          const wrapper = possibleValuesInput.closest("[class^='col-span']");
          if (label !== "Liste déroulante") {
            possibleValuesInput.value = "";
            wrapper.classList.add("animate__animated", "animate__fadeOut", "animate__faster");
            setTimeout(() => {
              wrapper.classList.add("hidden");
            }, 500);
          } else {
            possibleValuesInput.value = "";
            wrapper.classList.remove("hidden", "animate__animated", "animate__fadeOut", "animate__faster");
            wrapper.classList.add("animate__animated", "animate__fadeIn", "animate__faster");
          }
        });
      }
    }
  });

  addEventListener("turbo:before-stream-render", (event) => {
    const render = event.detail.render;
    event.detail.render = (streamElement) => {
      render(streamElement);
    };
  });
})

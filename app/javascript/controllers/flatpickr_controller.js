// app/javascript/controllers/flatpickr_controller.js
import { Controller } from "stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {
    const dateInputs = document.querySelectorAll(".date-input");

    const options = {
      dateFormat: "d-m-Y",
      defaultDate: "today",
      onClose: function (selectedDates, dateStr, instance) {
        if (instance.input === dateInputs[0]) {
          dateInputs[1].focus();
        }
      },
    };

    flatpickr(dateInputs, options);
  }
}

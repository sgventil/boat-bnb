import { Controller } from "stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {
    const dateInputs = document.querySelectorAll(".date-input");

    const options = {
      dateFormat: "d-m-Y",
      defaultDate: new Date(), // Set the default date to the current date
      onClose: function (selectedDates, dateStr, instance) {
        if (instance.input === dateInputs[0]) {
          dateInputs[1].focus();
        }
      },
    };

    flatpickr(dateInputs, options);

    // Prevent form submission when "Enter" is pressed
    dateInputs.forEach((input) => {
      input.addEventListener("keydown", (event) => {
        if (event.key === "Enter") {
          event.preventDefault();
        }
      });
    });
  }
}

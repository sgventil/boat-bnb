// app/javascript/controllers/flatpickr_controller.js
import { Controller } from "stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {
    flatpickr(".date-input", {
      dateFormat: "d-m-Y",
      defaultDate: "today",
    });
  }
}

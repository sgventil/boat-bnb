import { Controller } from "@hotwired/stimulus"

$(function() {

  $("#checkin-date").datepicker({
    dateFormat: "yy-mm-dd",
    minDate: 0,
    onSelect: function(selectedDate) {
      // Set the minimum date for check-out date to be the selected check-in date + 1 day
      $("#checkout-date").datepicker("option", "minDate", selectedDate);
    }
  });


  $("#checkout-date").datepicker({
    dateFormat: "yy-mm-dd",
    minDate: 1
  });
});

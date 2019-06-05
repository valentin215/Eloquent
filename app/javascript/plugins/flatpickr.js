import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

flatpickr("#course_start_date", {
  altInput: true,
  plugins: [new rangePlugin({ input: "#course_end_date"})]
});

flatpickr(".course_time", {
  enableTime: true,
  noCalendar: true,
  dateFormat: "H:i"
})

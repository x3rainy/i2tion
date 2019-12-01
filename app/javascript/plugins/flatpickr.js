// app/javascript/plugins/flatpickr.js
import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

flatpickr("#booking_start_datetime", {
  altInput: true,
  enableTime: true,
  plugins: [new rangePlugin({ input: "#booking_end_datetime"})]
})
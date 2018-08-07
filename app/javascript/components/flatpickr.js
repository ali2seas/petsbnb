import flatpickr from 'flatpickr';

const initDatepicker = function() {
  const startDateinput = document.getElementById('booking_start_date');
  const endDateinput = document.getElementById('booking_end_date');

  if (startDateinput && endDateinput) {
    flatpickr(startDateinput, {
    minDate: 'today',
        disable: [
        {
            from: "2018-08-13",
            to: "2018-08-15"
        },
        {
            from: "2018-08-22",
            to: "2018-08-24"
        },
        {
            from: "2018-09-01",
            to: "2018-09-04"
        }
    ],
    altInput: true,
    altFormat: "F j, Y",
    dateFormat: "Y-m-d",
    onChange: function(_, selectedDate) {
      if (selectedDate === '') {
        return endDateinput.disabled = true;
      }
      endDateCalendar.set('minDate', selectedDate);
      endDateinput.disabled = false;
    }
  });
    const endDateCalendar =
      flatpickr(endDateinput, {
        disable: [
        {
            from: "2018-08-13",
            to: "2018-08-15"
        },
        {
            from: "2018-08-22",
            to: "2018-08-24"
        },
        {
            from: "2018-09-01",
            to: "2018-09-04"
        }
    ],
        altInput: true,
        altFormat: "F j, Y",
        dateFormat: "Y-m-d",
      });
  }
}

const showDates = function() {
    const b = document.getElementById("booking-button");
    if (b != null) {
      b.addEventListener("click", function() {
        const x = document.getElementById("available-dates");
        if (x.style.display == "none") {
            x.style.display = "block";
        } else {
            x.style.display = "none";
        }
      })
    }
}



export { initDatepicker };
export { showDates };


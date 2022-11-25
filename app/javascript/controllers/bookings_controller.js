import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bookings"
export default class extends Controller {

  static targets = ["startDate", "endDate", "pricePerNight", "nights", "totalPrice"]

  showDetails() {
    console.log(this.startDateTarget.value);
    console.log(this.endDateTarget.value);
    var startDate = new Date(this.startDateTarget.value);
    var endDate = new Date(this.endDateTarget.value);
    var Difference_In_Time = startDate.getTime() - endDate.getTime();
    var Difference_In_Days = Difference_In_Time / (1000 * 3600 * 24);
    this.nightsTarget.innerText = Difference_In_Days * -1
    this.totalPriceTarget.innerText = Math.floor(50 * (Difference_In_Days * -1))
  }
}

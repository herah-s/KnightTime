import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="booking-subscription"
export default class extends Controller {
  static values = { bookingId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: 'BookingChannel', id: this.bookingIdValue },
      { received: data => console.log(data) }
    )
    console.log(`Subscribe to the chatroom with the id ${this.bookingIdValue}.`)
  }
}

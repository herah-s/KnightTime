import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="booking-subscription"
export default class extends Controller {
  static values = { bookingId: Number }
  static targets = ["messages"]


  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: 'BookingChannel', id: this.bookingIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed")
    this.channel.unsubscribe()
  }
}

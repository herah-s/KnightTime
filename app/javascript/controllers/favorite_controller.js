import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorite"
export default class extends Controller {
  connect() {
    console.log("favorite connected")
  }
  toggle_favorite(event) {
    console.log(event);
    event.currentTarget.classList.toggle("favorite")
  }

}

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="total-calculator"
export default class extends Controller {
  static targets = ['start', 'end', 'total', 'totalLabel']
  static values = {'price': Number}

  connect() {
  }

  calculate() {
    if (this.startTarget.value != "" && this.endTarget.value != "") {
      const totalDays = ((new Date(this.endTarget.value) - new Date(this.startTarget.value)) / 86400000) + 1
      const totalPrice = totalDays * this.priceValue
      this.totalTarget.innerHTML = `<i class="fa-solid fa-yen-sign gap-2"></i>${totalPrice}`
      console.log(this.totalLabelTarget)
      this.totalLabelTarget.classList.remove('d-none')
    } else {
      this.totalTarget.innerHTML = ""
    }
  }
}

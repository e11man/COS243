import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "selection", "additionalFields" ]
  
  initialize() {
    this.hideFields()
  }
  
  hideFields() {
    this.additionalFieldsTargets.forEach(element => {
      element.hidden = true
    })
  }

  showAdditionalFields() {
    this.hideFields()
    const selectedPayType = this.selectionTarget.value

    if (selectedPayType != "") {
      const selectedFields = this.additionalFieldsTargets.find(
        element => element.dataset.type == selectedPayType
      )

      if (selectedFields) {
        selectedFields.hidden = false
      }
    }
  }
}

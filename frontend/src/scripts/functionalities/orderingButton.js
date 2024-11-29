import arrow_up_down from "../../assets/arrow_up_down.svg"
import arrow_down from "../../assets/arrow_down.svg"
import arrow_up from "../../assets/arrow_up.svg"

export function createOrderingButton(urlParams) {
  const ordem = urlParams.get("ordem")

  const orderWrapper = document.querySelector("#order-wrapper")
  if (ordem == "desc") {
    orderWrapper.innerHTML += `<img src="${arrow_down}" alt=""/>`
  } else if (ordem == "asc") {
    orderWrapper.innerHTML += `<img src="${arrow_up}" alt=""/>`
  } else {
    orderWrapper.innerHTML += `<img src="${arrow_up_down}" alt=""/>`
  }

  const order = document.querySelector("#order")
  order.addEventListener("click", () => {
    if (ordem == "desc") {
      urlParams.set("ordem", "")
    } else if (ordem == "asc") {
      urlParams.set("ordem", "desc")
    } else {
      urlParams.set("ordem", "asc")
    }

    window.location.search = urlParams
  })
}

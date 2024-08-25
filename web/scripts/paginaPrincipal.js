const avatarButton = document.querySelector("header button img")
const hoverScreen = document.querySelector("#hover-screen")

document.addEventListener("click", (e) => {
    if (e.target !== avatarButton) {
        hoverScreen.classList.add("opacity")
    }
})

avatarButton.addEventListener("click", () => {
    hoverScreen.classList.toggle("opacity")
})

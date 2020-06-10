const removeQueryParams = () => {
  const modal = document.querySelector("#close-btn")
  if (modal) {
    modal.addEventListener("click", (event) => {
      window.history.replaceState({}, document.title, "/" + "dashboard");
    })
  }
}


export { removeQueryParams }

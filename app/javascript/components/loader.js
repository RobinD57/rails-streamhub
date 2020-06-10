// const checkLoad = () => {
//   document.addEventListener('DOMContentLoaded', (event) => {
//       document.querySelector(".loader-wrapper").innerHTML = " "
//   });
// }

const checkLoad = () => {
window.addEventListener('load', (event) => {
  const loader = document.querySelector(".loader-wrapper")
  if (loader) {
    loader.innerHTML = " "
    // loader.style.display = "none"
    loader.classList.add("hidden")
    }
  });
}

export { checkLoad };

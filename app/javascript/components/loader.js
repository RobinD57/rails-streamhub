// const checkLoad = () => {
//   document.addEventListener('DOMContentLoaded', (event) => {
//       document.querySelector(".loader-wrapper").innerHTML = " "
//   });
// }

const checkLoad = () => {
window.addEventListener('load', (event) => {
  document.querySelector(".loader-wrapper").innerHTML = " "
  document.querySelector(".loader-wrapper").classList.add("hidden")
  });
}

export { checkLoad };

// const checkLoad = () => {
//   document.addEventListener('DOMContentLoaded', (event) => {
//       document.querySelector(".loader-wrapper").innerHTML = " "
//   });
// }

const checkLoad = () => {
window.addEventListener('load', (event) => {
  document.querySelector(".loader-wrapper").style.display = "none"
  });
}

export { checkLoad };

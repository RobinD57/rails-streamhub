const checkLoad = () => {
  document.addEventListener('DOMContentLoaded', (event) => {
      document.querySelector(".loader-wrapper").innerHTML = " "
  });
}

export { checkLoad };

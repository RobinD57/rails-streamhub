const linkAccountButton = () => {
  const buttonWrappers = document.querySelectorAll(".connect-wrapper")
  if (buttonWrappers) {
    buttonWrappers.forEach((wrapper) => wrapper.addEventListener("mouseenter", (event) => {
      const connectedButton = wrapper.querySelector(".linked-button");
      const unlinkButton = wrapper.querySelector(".unlink-account");
      connectedButton.style.visibility = "hidden";
      unlinkButton.style.visibility = "visible";
    }));
    buttonWrappers.forEach((wrapper) => wrapper.addEventListener("mouseleave", (event) => {
      const connectedButton = wrapper.querySelector(".linked-button");
      const unlinkButton = wrapper.querySelector(".unlink-account");
      connectedButton.style.visibility = "visible";
      unlinkButton.style.visibility = "hidden";
    }));
  }
}


export { linkAccountButton }

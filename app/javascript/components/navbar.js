const nav = document.querySelector(".navbar-main");
const logo = document.querySelector("#logo-big");
const navExpanse = document.querySelector("#navbarSupportedContent");

const toggleCaret = () => {
  document.querySelector(".navbar-toggler").addEventListener( "click",() => {
    if (nav) {
      if (!navExpanse.classList.contains("show")) {
        document.querySelector("#arrow").style.display = "inline-block";
      }
       else if (navExpanse.classList.contains("show")) {
        document.querySelector("#arrow").style.display = "none";
      }
    }
  });
};

const shrinkAndGrowNav = () => {
  if (nav) {
    document.addEventListener("scroll",(e) => {
      if (window.scrollY > 67 && !nav.classList.contains("shrink")) {
        nav.classList.add("shrink");
        logo.style.display = "none";
      }
      else if (window.scrollY < 67 && nav.classList.contains("shrink")) {
        nav.classList.remove("shrink");
        logo.style.display = "";
      }
    });
  }
};


const closeNav = () => {
  const elements = document.querySelectorAll(".closer");
  elements.forEach((link) => link.addEventListener("click",() => {
    document.querySelector("#navbarSupportedContent").classList.remove("show");
    document.querySelector("#arrow").style.display = "none";
  }));
};

export { toggleCaret };
export { shrinkAndGrowNav };
export { closeNav };

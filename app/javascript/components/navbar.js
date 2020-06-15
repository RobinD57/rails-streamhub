const nav = document.querySelector(".navbar-main");
const logo = document.querySelector("#logo-big");
const navExpanse = document.querySelector("#navbarSupportedContent");
const arrow = document.querySelector("#arrow");
const toggler = document.querySelector(".navbar-toggler");


const toggleCaret = () => {
  if ( toggler != undefined) {
    toggler.addEventListener( "click",() => {
      if (nav) {
        if (!navExpanse.classList.contains("show")) {
          arrow.style.display = "inline-block";
        }
         else if (navExpanse.classList.contains("show")) {
          arrow.style.display = "none";
        }
      }
    });
  }
};

const shrinkAndGrowNav = () => {
  if (nav) {
    document.addEventListener("scroll",(e) => {
      if (window.scrollY > 67 && !nav.classList.contains("shrink")) {
        nav.classList.add("shrink");
        logo.style.display = "none";
        toggler.classList.add("padded");
      }
      else if (window.scrollY < 67 && nav.classList.contains("shrink")) {
        nav.classList.remove("shrink");
        logo.style.display = "";
        toggler.classList.remove("padded");
      }
    });
  }
};

const closeNav = () => {
  const elements = document.querySelectorAll(".closer");
  elements.forEach((link) => link.addEventListener("click",() => {
    navExpanse.classList.remove("show");
    arrow.style.display = "none";
  }));
};

export { toggleCaret };
export { shrinkAndGrowNav };
export { closeNav };

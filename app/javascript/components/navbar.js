const nav = document.querySelector(".navbar-main");
const logo = document.querySelector("#logo-big");

const morphLogo = () => {
$( ".navbar-toggler").on( "click", function() {
  $( "#arrow" ).toggle();
  })
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
  };
};


const closeNav = () => {
  const elements = document.querySelectorAll(".closer");
  elements.forEach((link) => link.addEventListener("click",() => {
    document.querySelector("#navbarSupportedContent").classList.remove("show");
    document.querySelector("#arrow").style.display = "none";
  }));
};

export { morphLogo };
export { shrinkAndGrowNav };
export { closeNav };

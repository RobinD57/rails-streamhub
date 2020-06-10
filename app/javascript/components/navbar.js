const nav = document.querySelector(".navbar-main");
const logo = document.querySelector("#logo-big");

const morphLogo = () => {
$( ".navbar-toggler").on( "click", function() {
  $( "#arrow" ).toggle();
  })
};

const scrollShrinkFunction = () => {
  if (nav)
    document.addEventListener("scroll",(e) => {
      if (window.scrollY > 10) {
        nav.classList.add("shrink");
        logo.style.display = "none";
        console.log(e.scrollY)
      }
    });
};

const scrollGrowFunction = () => {
  if (nav)
    document.addEventListener("scroll",(e) => {
      if (window.scrollY < 120) {
        nav.classList.remove("shrink");
        logo.style.display = "";
      }
    });
};


const scrollFinal = () => {
  scrollShrinkFunction();
  scrollGrowFunction();
}


const closeNav = () => {
  const elements = document.querySelectorAll(".closer");
  elements.forEach((link) => link.addEventListener("click",() => {
    document.querySelector("#navbarSupportedContent").classList.remove("show");
    document.querySelector("#arrow").style.display = "none";
  }));
};

export { morphLogo };
export { scrollFinal };
export { closeNav };

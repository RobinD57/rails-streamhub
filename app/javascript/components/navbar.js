const morphLogo = () => {
$( ".navbar-toggler").on( "click", function() {
  $( "#arrow" ).toggle();
  })
};

const scrollFunction = () => {
 $(document).on("scroll",function(){
  if ($(document).scrollTop() > 80){
    $(".navbar-main").addClass("shrink");
    $("#logo-big").hide();
    //$("#logo-small").show();
  }else {
      $(".navbar-main").removeClass("shrink");
      $("#logo-big").show();
      $("#logo-small").hide();
    }
  });
}

const scrollFinal = () => {
  window.onscroll = function() {scrollFunction()};
}

const closeNav = () => {
  const elements = document.querySelectorAll(".closer");
  elements.forEach((link) => link.addEventListener("click",() => {
    document.querySelector("#navbarSupportedContent").classList.remove("show");
    console.log("hi");
    document.querySelector("#arrow").style.display = "none";
  }));
};

export { morphLogo };
export { scrollFinal };
export { closeNav };

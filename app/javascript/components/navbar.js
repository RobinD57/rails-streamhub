

const morphLogo = () => {
$( ".navbar-toggler").on( "click", function() {
  $( "#arrow" ).toggle();
  })
};


const scrollFunction = () => {
 $(document).on("scroll",function(){
  if ($(document).scrollTop() > 100){
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

export { morphLogo };
export { scrollFinal };

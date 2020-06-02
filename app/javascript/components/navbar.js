const morphLogo = () => {
$( "#settings" ).on( "click", function() {
  $( "#arrow" ).toggle();
  })
};

const scroll = () => {
  $ (document).on("scroll", function() {
    $(".navbar-main")
  })
}

export { morphLogo };
export { scroll };

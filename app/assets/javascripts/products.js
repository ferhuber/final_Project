$(document).ready(function(){



  $wrapper = $('#wrapper');
  $drawerRight = $('#drawer-right');

  function setSlideNav(){
    $(".move").click(function(e){

      e.preventDefault();

      if($wrapper.css('marginLeft')!='0px'){
        $drawerRight.animate({marginRight : 0},200);
        $wrapper.animate({marginLeft : -300},200);
      }

    })
  }

  setSlideNav();

  function setSlideNav1(){
    $(".move1").click(function(e){
      e.preventDefault();

      if($wrapper.css('marginLeft')!='0px'){
        $drawerRight.animate({marginRight : -300},200);
        $wrapper.animate({marginLeft : 0},200);
      }
    })
  }

  setSlideNav1();

  });

  $(window).scroll(function (event) {
    let scroll = $(window).scrollTop();
    if (scroll > 300) {

        jQuery('#nav .top').addClass('solid');
          $( ".solid" ).fadeIn( "slow");
          $( ".Logo-small" ).fadeIn( "slow");
          $('.Logo').hide();

      } else {
        jQuery('#nav .top').removeClass('solid');
        $( ".solid" ).fadeIn( "slow");
        $('.Logo-small').hide();
        $('.solid').hide();
        $( ".Logo" ).fadeIn( "slow");

      }
});

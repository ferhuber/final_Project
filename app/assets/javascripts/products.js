$(document).ready(function(){

  const list = $(".gallery-thumb");
  var index = 0;

  const interval = setInterval(function() {
    $(list[index]).addClass('fade-in');
    index++;
    if (index === list.length) {
      clearInterval(interval);
    }
  }, 50)


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

jQuery(document).ready(function ($) {

  $('#slider').ready(function(){
    setInterval(function () {
        moveRight();
    }, 6000);
  });

	var slideCount = $('#slider ul li').length;
	var slideWidth = $('#slider ul li').width();
	var slideHeight = $('#slider ul li').height();
	var sliderUlWidth = slideCount * slideWidth;

	$('#slider').css({ width: slideWidth, height: slideHeight });

	$('#slider ul').css({ width: sliderUlWidth, marginLeft: - slideWidth });

    $('#slider ul li:last-child').prependTo('#slider ul');

    // function moveLeft() {
    //     $('#slider ul').animate({
    //         left: + slideWidth
    //     }, 300, function () {
    //         $('#slider ul li:last-child').prependTo('#slider ul');
    //         $('#slider ul').css('left', '');
    //     });
    // };

    function moveRight() {
        $('#slider ul').animate({
            left: - slideWidth
        }, 2000, function () {
            $('#slider ul li:first-child').appendTo('#slider ul');
            $('#slider ul').css('left', '');
        });
    };

    // $('a.control_prev').click(function (e) {
    //   e.preventDefault();
    //     moveLeft();
    // });
    //
    // $('a.control_next').click(function (e) {
    //   e.preventDefault();
    //     moveRight();
    // });

    $('#product-select').on('change',function() {
      const prodID = ($('#product-select option:selected').attr('id'));
      const url = 'http://localhost:3000/products/' + prodID + '.json';
      $.get(url, function(data) {

        data.flavours.forEach( function(flavour) {
          let flav = '<option>' + flavour.flavour + '</option>';
          $('#flavours').show();
          $('#flavours').append(flav);
        });

        data.types.forEach( function(type) {
          let typ = '<option>' + type.type_of + '</option>';
          $('#types').show();
          $('#types').append(typ);
        })
      })
    });
    $("#product-form").submit(function(event){
      event.preventDefault();
      $(".list-order").append($(`<div class="test">${event.target[0].value}</div>`))

    });

});

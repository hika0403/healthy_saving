$(window).on('scroll', function (){

  var anime = $('.animate__animated');
  var isAnimate = 'animate__zoomIn';
  
  anime.each(function () {
  
    var elemOffset = $(this).offset().top;
    var scrollPos = $(window).scrollTop();
    var wh = $(window).height();

    if(scrollPos > elemOffset - wh + (wh / 3) ){
      $(this).addClass(isAnimate);
    }
  });

});
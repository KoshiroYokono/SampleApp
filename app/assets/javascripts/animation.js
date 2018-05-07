$(function() {
    var before = $(window).scrollTop();
    $(window).scroll(function() {
       var after = $(window).scrollTop();
       if(before > after) {
          $('nav').stop().animate({
             top: 0
          }, 500)
       }
       else if(before < after && before >= 0) {
          $('nav').stop().animate({
             top: '-71px'
          }, 500)
       }
       before = after;
    });
});

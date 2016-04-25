$(function(){
  $('.up').hide()

  var top = 0;
  $('#loopify').on('click', function(){
    top -= 100;
    $('.section').animate({'top': top +'%'});
    $('.up').fadeIn(2000);
  });


  $('.up').on('click', function(){
    top += 100;
    $('.section').animate({'top': top +'%'});
    $('.up').fadeOut(100);
  });
});

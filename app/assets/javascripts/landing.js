$(function(){
  $('.up').hide()
  $('.down').hide()

  var top = 0;
  $('#loopify').on('click', function(){
    top -= 100;
    $('.section').animate({'top': top +'%'});
    $('.up').fadeIn(2000);
    $('.down').fadeIn(2000);
  });


  $('.up').on('click', function(){
    top += 100;
    $('.section').animate({'top': top +'%'});
    $('.up').fadeOut(100);
  });

  $('.down').on('click', function(){
    top -= 100;
    $('.section').animate({'top': top +'%'});
    $('.down').fadeOut(100);
  });
});

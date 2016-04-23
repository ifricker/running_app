$(function(){
  var top = 0;
  $('#loopify').on('click', function(){
    top -= 100;
    $('.section').animate({'top': top +'%'});
  });
});

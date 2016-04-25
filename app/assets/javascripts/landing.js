$(function(){
  $('.up').hide()
  $('.down').hide()

  $('.button').on("mouseenter", function(){
    $(".loopify").hide()
    $("#loopify").show()
  })

  $('.button').on("mouseleave", function(){
    $(".loopify").show()
    $("#loopify").hide()
  })

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
    if(top === 0){
      $('.up').fadeOut(100);
    }
    else if(top === -100){
      $('.down').fadeIn(100);
    }
  });

  $('.down').on('click', function(){
    top -= 100;
    $('.section').animate({'top': top +'%'});
    if(top === -200){
      $('.down').fadeOut(100);
    }
    else if(top < 0){
      $('.up').fadeIn(100);
    }
  });
});

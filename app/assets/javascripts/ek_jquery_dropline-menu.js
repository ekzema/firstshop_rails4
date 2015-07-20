$(document).ready(function(){

// $('.nav > li > div').hide(); 
var speedHideMenu = 400;
var speedShowMenu = 700;
var intervalStop;
 $('.nav > li').hover(function (){
  var chilDiv = $(this).children('div')
    if ($('.nav > li > div').is(':visible')) {
                
          $('.nav > li > div').stop().animate({height: 'hide'}, speedHideMenu, 'easeOutQuart', intervalStop=setTimeout(function(){
            chilDiv.stop().animate({height: 'show'}, speedShowMenu, 'easeOutQuart');
          }, speedHideMenu));
        
        
    } else {
    $(this).children('div').stop().animate({height: 'show'}, speedShowMenu, 'easeOutQuart');
      }
    }, function(){
       $(this).children('div').stop().animate({height: 'hide'}, speedHideMenu, 'easeOutQuart'); 
       clearInterval(intervalStop);
    });

 $(window).scroll(function(){                              // отслеживаем событие
   if ( $(window).scrollTop() <= 0 ){                   // ставим условие
      $('#fixPanel').removeClass('panel2-mini');
      } else {
        $('#fixPanel').addClass('panel2-mini');
         // определяем действие
   }
});

 });


        // $('#product_search').css('z-index', '0');     
        // $('#wrapSlick').css('background-image', 'none');            
        // $('.panel2 img').css('display', 'none');   
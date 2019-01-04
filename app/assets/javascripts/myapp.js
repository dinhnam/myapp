$(document).ready(function(){
    //hide alert
    function hide_alert(){
        $(".alert").delay(4000).hide(200);
    };
    window.onload = hide_alert();
    //drop menu
    $('.click').click(function(){
      var check = $(this).next().css("display") == "none";
      var menus = document.getElementsByClassName('menu');
      for(var i = 0; i< menus.length; i++){
        menus[i].style.display = "none";
      }
      if(check == true){
        $(this).next().show(200);
      }else{
        $(this).next().hide();
      }
    });
    //filter
    $(".content .bar input[type=checkbox]").click(function(){
      $('.genres_checked').remove();
      $.each($("input[name='genres[]']:checked"), function() {
        var genre = $(this).next().text();
        $('.content .drop').after(
          "<li class='genres_checked left' style='font-size: 14px; padding: 5px;"+
          "margin: 4px 2px; border-radius: 5px; background-color: #19414d;'>"+
          genre+"</li>"
          );
        });
    });
    //item movie
    $('.item-container .read-me').click(function(){
      $(this).next().toggle('slide');
    });
    //function slider
    var slideIndex = 0;
    var dots = document.getElementsByClassName("dot");
    var slides = document.getElementsByClassName("slide-item");
    function showSlides(n) {
      var i;
      if (n > slides.length-1) {slideIndex = slides.length-1}    
      if (n < 0) {slideIndex = 0}
      for (i = 0; i < dots.length; i++) {
          dots[i].className = dots[i].className.replace(" active", "");
      }
      document.getElementById("slides").style.left = "-"+slideIndex+"00%";
      dots[slideIndex].className += " active";
    }
    $('.prev-slide').click(function(){
      showSlides(slideIndex-=1);
    });
    $('.next-slide').click(function(){
      showSlides(slideIndex+=1);
    });
    $('.dot').click(function(){
      slideIndex = parseInt(this.id);
      showSlides(slideIndex);
    });
    if(slides.length >0){
      showSlides(slideIndex);
    }
    //comment
    $('.reply-click').click(function(){
      var replys_id = "reply-"+this.id;
      var replys = document.getElementById(replys_id);
      if($(replys).css('display') == "none"){
         $(this).text("Hide..");
      }else{
         $(this).text("Reply");
      }
      $(replys).toggle();
     
    });
});
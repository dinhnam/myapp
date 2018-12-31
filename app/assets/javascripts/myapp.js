$(document).ready(function(){
    //drop menu
    $('.click').click(function(){
      var check = $(this).next().css("display") == "none";
      var menus = document.getElementsByClassName('menu');
      for(var i = 0; i< menus.length; i++){
        menus[i].style.display = "none";
      }
      if(check == true){
        $(this).next().show(200);
      }
    });
    //filter
    $(".content .bar input[type=checkbox]").click(function(){
      $('.genres_checked').remove();
      $.each($("input[name='genres[]']:checked"), function() {
        var genre = $(this).next().text();
        $('.content .drop').after(
          "<li class='genres_checked'"+
          "style='"+
          "color: #bbb; font-size:14px; margin: 7px 2px; cursor: default;"+
          "background-color: rgb(41, 33, 48);"+
          "border-radius: 8px 0px 8px 0px;"+
          "'>"+genre+"</li>"
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
    showSlides(slideIndex);
    //
});
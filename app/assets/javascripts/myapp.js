$(document).ready(function(){
    //hide alert
    function hide_alert(){
        $(".alert").delay(4000).hide(0);
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
    $("#filter-icon").click(function(){
      $(".filters").toggle(0);
    });
    $(".bar input[type=checkbox]").click(function(){
      $('.genres_checked').remove();
      $.each($("input[name='genres[]']:checked"), function() {
        var genre = $(this).next().text();
        $('.filters .drop').after(
          "<li class='genres_checked left' style='font-size: 14px; padding: 4px;"+
          "margin: 4px 2px; border-radius: 5px; background-color: #19414d;'>"+
          genre+"</li>"
          );
        });
    });
    //slider
    var slideIndex = 0;
    var slides = document.getElementsByClassName("wallpager");
    var thumbs = document.getElementsByClassName("thumb");
    var listSlide = document.getElementById("list-slide");
    var listThumb = document.getElementById("list-thumb");
    if(slides.length>0){showSlides(slideIndex)}
    function showSlides(n) {
      var i;
      if (n >= slides.length-1) {slideIndex = slides.length-1}    
      if (n < 0) {slideIndex = 0}
      for (i = 0; i < slides.length; i++) {
          slides[i].className = slides[i].className.replace(" active", "");
          thumbs[i].className = thumbs[i].className.replace(" active", "");
      }
      slides[slideIndex].className += " active";
      thumbs[slideIndex].className += " active";
      listSlide.style.left = (15-slideIndex*70).toString()+"%";
      if(slideIndex%4==0){
        listThumb.style.left = (-slideIndex*20).toString()+"%";
      }
    }
    $('.prev-slide').click(function(){
      showSlides(slideIndex-=1);
    });
    $('.next-slide').click(function(){
      showSlides(slideIndex+=1);
    });
    $('.wallpager').click(function(){
      slideIndex = parseInt(this.id);
      showSlides(slideIndex);
    });
    $('.thumb').click(function(){
      slideIndex = parseInt(this.id);
      showSlides(slideIndex);
    });
    
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
    //searching
    var url = '/suggest'
    const $source = document.querySelector('#search input[type=text]');
    const $result = document.querySelector('#result');
    const searching = function(e) {
      if(e.target.value.length > 2){
        if (window.XMLHttpRequest) {
          // code for IE7+, Firefox, Chrome, Opera, Safari
          xmlhttp=new XMLHttpRequest();
        } else {  // code for IE6, IE5
          xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange=function() {
          if (this.readyState==4 && this.status==200) {
            $result.innerHTML=this.response;
          }
        }
        xmlhttp.open("GET",url+"?search="+e.target.value,true);
        xmlhttp.send();
      }else{
        $result.innerHTML = "";
      }
    }
    $source.addEventListener('input', searching ) // register for oninput
    $source.addEventListener('propertychange', searching ) // for IE8
    //
});
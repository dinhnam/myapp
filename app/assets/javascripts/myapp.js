$(document).ready(function(){
    //alert
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
      $(".filters").toggle(20);
    });
    $("#default-filte").click(function(){
      $("input[type=checkbox]").prop('checked', false);
      $("select").prop('selectedIndex', 0);
    });
    //slider
    var slideIndex = 0;
    var leftThumb = 0;
    var slides;
    var thumbs;
    var listSlide = document.getElementById("list-slide");
    var listThumb = document.getElementById("list-thumb");
    var sliderContainer = document.getElementById("slider-container");
    var x_origin;
    var left_origin;
    var widthContainer=0;
    var witdhThumb=0;
    var widthSlide=0;
    function mouseMove(){
      if(event.which == 1 || ('ontouchstart' in document.documentElement)){
        if(event.which == 1){
          leftThumb = left_origin - (x_origin - event.clientX);
        }else{
          leftThumb = left_origin - 1.2*(x_origin - event.touches[0].clientX);
        }
        if(leftThumb>50){leftThumb=50}
        if(leftThumb<widthContainer/2-$(listThumb).width())
        {
          leftThumb=widthContainer/2-$(listThumb).width();
        }
        $(listThumb).css('left',leftThumb);
      }
    }
    function mouseDown(){
      if(event.which == 1){
        x_origin = event.clientX;
      }else if('ontouchstart' in document.documentElement){
        x_origin = event.touches[0].clientX;
      }
      left_origin = $(listThumb).position().left;
    }
    function mouseEnter(){
      window.onwheel = function() {return false;};
    }
    function mouseLeave(){
      window.onwheel = function() {return true;};
    }
    function mouseWheel(){
      if(event.deltaY>0){
        leftThumb-=100;
      }else{
        leftThumb+=100;
      }
      if(leftThumb>50){leftThumb=50}
      if(leftThumb<widthContainer/2-$(listThumb).width())
      {
        leftThumb=widthContainer/2-$(listThumb).width();
      }
      $(listThumb).css('left',leftThumb);
    }
    if(listThumb != null){
      listThumb.addEventListener("mousemove", function(event) {
        mouseMove(event);
      });
      listThumb.addEventListener("mousedown", function(event) {
        mouseDown(event);
      });
      //working in mobie
      listThumb.addEventListener("touchmove", function(event) {
        mouseMove(event);
      });
      listThumb.addEventListener("touchstart", function(event) {
        mouseDown(event);
      });
      //
      listThumb.addEventListener("mouseenter", function(event) {
        mouseEnter(event);
      });
      listThumb.addEventListener("mouseleave", function(event) {
        mouseLeave(event);
      });
      listThumb.addEventListener("mousewheel", function(event) {
        mouseWheel(event);
      });
    }
    function init(){
      slides = document.getElementsByClassName("slide-item");
      slidesItem = document.querySelectorAll(".slide-item .item");
      thumbs = document.getElementsByClassName("thumb-item");
      widthContainer = $(sliderContainer).width();
      if(slides.length>0){
        widthThumb = $(listThumb).width()/slides.length;
        widthSlide = $(listSlide).width()/slides.length;
        showSlides(slideIndex);
      }
    }
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
      var left = widthContainer/2 - widthSlide/2 - slideIndex*widthSlide
      $(listSlide).css('left',left);
      if(slideIndex>0){
        leftThumb = widthContainer/2 - widthThumb/2 - slideIndex*widthThumb
      }else{
        leftThumb = 0;
      }
      $(listThumb).css('left',leftThumb);
    }
    init();
    $(window).resize(function(){
       init();
    });
    $('.prev-slide').click(function(){
      showSlides(slideIndex-=1);
    });
    $('.next-slide').click(function(){
      showSlides(slideIndex+=1);
    });
    $('.slide-item').click(function(){
      slideIndex = parseInt(this.id);
      showSlides(slideIndex);
    });
    $('.thumb-item').click(function(){
      slideIndex = parseInt(this.id);
      showSlides(slideIndex);
    });
    $('#focus').click(function(){
      $('.focus').toggle(50);
      $(this).toggleClass("white");
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
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
    $("#reset-filte").click(function(){
      $("input[type=checkbox]").prop('checked', false);
      $("select").prop('selectedIndex', 0);
    });
    //slider
    var slideIndex = 0;
    var ThumbXAxis = 0;
    var downXAxis = 0;
    var SlideXAxis = 0;
    var slides;
    var thumbs;
    const listSlide = document.getElementById("list-slide");
    const listThumb = document.getElementById("list-thumb");
    const sliderContainer = document.getElementById("slider-container");
    const thumbContainer = document.getElementById("thumb-container");
    var widthslideContainer = 0;
    var widthThumbContainer = 0;
    var widthSlide=0;
    var widthThumb=0;
    var interval = setInterval(nextSlide, 5000);
    function translateX(x){
      if(x>10){x=10}
      if(x<-(slides.length - 2.5)*widthThumb)
      {
        x=-(slides.length -2.5)*widthThumb;
      }
      $(listThumb).css('left',x);
    }
    function mouseMove(){
      if(event.which == 1){
        $('.thumb-item').css('pointer-events','none');
        translateX(ThumbXAxis - downXAxis + event.clientX);
      }
    }
    function touchMove(){
       if('ontouchstart' in document.documentElement){
        translateX(ThumbXAxis - downXAxis + event.touches[0].clientX);
      }
    }
    function mouseDown(){
      downXAxis = event.clientX;
      ThumbXAxis = $(listThumb).position().left;
    }
    function touchStart(){
      downXAxis = event.touches[0].clientX;
      ThumbXAxis = $(listThumb).position().left;
    }
    function mouseEnter(){
      window.onwheel = function() {return false;};
    }
    function mouseLeave(){
      window.onwheel = function() {return true;};
    }
    function mouseWheel(){
      if(event.deltaY>0){
        ThumbXAxis-=100;
      }else{
        ThumbXAxis+=100;
      }
      translateX(ThumbXAxis);
    }
    function mouseUp(){
      $('.thumb-item').css('pointer-events','auto');
    }
    if(sliderContainer != null){
      listThumb.addEventListener("mousemove", function(event) {
        mouseMove(event);
      });
      listThumb.addEventListener("mousedown", function(event) {
        mouseDown(event);
      });
      sliderContainer.addEventListener("mouseup", function(event) {
        mouseUp(event);
      });
      //working in mobie
      listThumb.addEventListener("touchmove", function(event) {
        touchMove(event);
      });
      listThumb.addEventListener("touchstart", function(event) {
        touchStart(event);
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
      sliderContainer.addEventListener("mouseenter", function(event) {
        clearInterval(interval);
      });
      sliderContainer.addEventListener("mouseleave", function(event) {
        interval = setInterval(nextSlide, 5000);
      });
    }
    function nextSlide(){
      if(listThumb!=null){
        showSlides(slideIndex+=1);
      }
    }
    function init(){
      slides = document.getElementsByClassName("slide-item");
      slidesItem = document.querySelectorAll(".slide-item .item");
      thumbs = document.getElementsByClassName("thumb-item");
      if(listSlide!=null){
        widthslideContainer = $(sliderContainer).width();
        widthThumbContainer = $(thumbContainer).width();
        listSlide.style.width = slides.length*100 + "%";
        listThumb.style.width = slides.length*25 + "%"
        widthThumb = $(listThumb).width()/slides.length;
        widthSlide = $(listSlide).width()/slides.length;
        showSlides(slideIndex);
      }
    }
    function showSlides(n) {
      var i;
      if (n >= slides.length) {slideIndex = 0}    
      if (n < 0) {slideIndex = 0}
      for (i = 0; i < slides.length; i++) {
        slides[i].className = slides[i].className.replace(" active", "");
        thumbs[i].className = thumbs[i].className.replace(" active", "");
      }
      slides[slideIndex].className += " active";
      thumbs[slideIndex].className += " active";
      SlideXAxis = -slideIndex*widthSlide;
      $(listSlide).css('left',SlideXAxis);
      if(slideIndex<3){
        ThumbXAxis = 0;
      }
      if(slideIndex >= 3 ){
        ThumbXAxis = -(slideIndex+0.5)*widthThumb + widthThumbContainer/2;
      }
      $(listThumb).css('left',ThumbXAxis);
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
    //suggest form
    var url = '/suggest'
    var $source = document.querySelectorAll(".input-suggest input[type=text]");
    const suggest = function(e) {
      var key = e.target.name;
      var result = document.querySelector("#result-"+key);
      if(e.target.value.length > 2){
        if (window.XMLHttpRequest) {
          xmlhttp=new XMLHttpRequest();
        } else {
          xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange=function() {
          if (this.readyState==4 && this.status==200) {
            result.innerHTML=this.response;
          }
        }
        xmlhttp.open("GET",url+"?"+key+"="+e.target.value,true);
        xmlhttp.send();
      }else{
        result.innerHTML = "";
      }
    }
    for(var i=0; i< $source.length; i++){
     $source[i].addEventListener('input', suggest ) // register for oninput
     $source[i].addEventListener('propertychange', suggest ) // for IE8
    }
    //form film upload
    function validateFile(file){
      var check = true;
      if(file.length > 1){
        check = false;
        alert("You can only upload a maximum of 1 files");
      }
      if(file[0].size > 5*1024*1024){
        check = false;
        alert("File size is larger than 5MB!");
      }
      return check;
    }
    function imagesPreview(input, preview){
      if (input.files) {
        if(validateFile(input.files)){
          $(preview).find('img').remove();
          var reader = new FileReader();
          reader.onload = function(event) {
              var img = $($.parseHTML('<img>')).attr('src', event.target.result);
              img.appendTo(preview);
          }
          reader.readAsDataURL(input.files[0]);
        }else{
          input.value = '';
        }
      }
    }

    $('#cover-upload').on('change', function() {
      imagesPreview(this, $('#cover-preview .preview'));
    });

    $('#wallpaper-upload').on('change', function() {
      imagesPreview(this, $('#wallpaper-preview .preview'));
    });
    
    $(".image-upload").on("click", ".preview", function(){
      $(this).prev().trigger('click');
    });
    
    function setNames(elm, index){
      var name = "film[episodes_attributes]["+index+"][name]";
      var number = "film[episodes_attributes]["+index+"][number]"
      var link = "film[episodes_attributes]["+index+"][link]";
      $(elm).find(".name").attr("name", name);
      $(elm).find(".number").attr("name", number);
      $(elm).find(".link").attr("name", link);
    }
    
    $('.add-episode').click(function(){
      var episodesInput = document.getElementsByClassName("episodes-input");
      var length = episodesInput.length;
      for(var i=0;i<length;i++){
        setNames(episodesInput[i], i);
      }
      var newEpisode = $(episodesInput[length-1]).clone();
      newEpisode.find("input").val("");
      setNames(newEpisode, length);
      $("#film-episodes").append(newEpisode);
    });
    
    $("#film-episodes").on("click", ".delete-episode", function(){
      var episodes = document.getElementsByClassName("episodes-input");
      if(episodes.length > 1){
        this.closest(".episodes-input").remove();
        var episodesInput = document.getElementsByClassName("episodes-input");
        var length = episodesInput.length;
        for(var i=0;i<length;i++){
          setNames(episodesInput[i], i);
        }
      }
    });
    
    $(".input-suggest").on("click", ".item-seach", function(){
       var name = $(this).find('span').text();
       var tem = $(this).closest( ".input-suggest" );
       $(tem).find('input').val(name);
    }); 

});
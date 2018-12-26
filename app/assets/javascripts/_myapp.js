$(document).ready(function(){
    $('.content .drop button').click(function(){
      $(this).next().toggle(100);
    });
    
    $(".content .bar input[type=checkbox]").click(function(){
      $('.genres_checked').remove();
      $.each($("input[name='genres[]']:checked"), function() {
        var genre = $(this).next().text();
        $('.content .drop').after(
          "<li class='genres_checked'"+
          "style='"+
          "color: #bbb; font-size:13px; margin: 5px; cursor: default;"+
          "background-color: rgb(41, 33, 48);"+
          "border-radius: 10px 0px 10px 0px;"+
          "'>"+genre+"</li>"
          );
        });
    });
    
    $('.item-container .read-me').click(function(){
      $(this).next().toggle('slide');
    });
});
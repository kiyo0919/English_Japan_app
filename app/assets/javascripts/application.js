//= require jquery3
//= require popper
//= require bootstrap
/* global $*/
//= require_tree .


$(function(){
  //ボタンのイベント
  $("#button1").click(function() {
    $(".english").toggle();
  });
});

$(function(){
  $("#button2").click(function() {
    $(".japanese").toggle();
  });
});



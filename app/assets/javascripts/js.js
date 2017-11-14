// JavaScript Document

var prev = 0;
var $window = $(window);
var nav = $('#navbar');

$window.on('scroll', function(){
  var scrollTop = $window.scrollTop();
  nav.toggleClass('hidden', scrollTop > prev);
  prev = scrollTop;
});
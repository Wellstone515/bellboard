$(document).on('turbolinks:load', function(){
  $(".header__top__list-first__child").hide();
  $(".header__top__list-first").hover(function(){
    $("ul:not(:animated)", this).slideDown();
  }, function(){
    $("ul", this).slideUp();
  }).find("ul").hide();
});
$(document).on('turbolinks:load', function(){
  $(".header__top__list-first__child").hide();
  $(".header__top__list-first").hover(function(){
    $("ul:not(:animated)", this).slideDown();
  }, function(){
    $("ul", this).slideUp();
  }).find("ul").hide();

  $(".inputFile").on("change", function(){
    var file = this.files[0];
    var fileReader = new FileReader();
    fileReader.onload = function(e){
      var loadedImageUri = e.target.result;
      $(".post-new__file-field__outputImage").empty();
      // $(".outputImage").append('<img src="'+ loadedImageUri + '">');
      // $(".outputImage").html('<img src="'+ loadedImageUri + '">');
      $(".post-new__file-field__outputImage").append($('<img>').attr({
        src: e.target.result,
        width: "250px"
      }));
    };
    fileReader.readAsDataURL(file);
  });

  $("#comment_body").keyup(function(){
    var inputbox = $(this).val();
    if(inputbox == ""){
      $(".post-show-main__comment-box").css("display", "none");
    } else {
    $(".post-show-main__comment-box").slideDown();
    }
  });
  // $("#comment_body").blur(function(){
  //   $(".post-show-main__comment-box").css("display", "none");
  // });
  $("#comment_body").submit(function(){
    $(".post-show-main__comment-box").css("display", "none");
  });

});
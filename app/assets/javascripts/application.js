//= require jquery
//= require jquery_ujs
//= require_tree .
$( document ).ready(function() {
  $('.upvote').on ('click', function(e){
    event.preventDefault();
    var url = event.currentTarget.href;
    $.ajax({
      url: url,
      data: $(this).serialize()
    }).done(function(response){
      var id = response.split(":")[0];
      var voteCount = response.split(":")[1];
      $(id).children()[1].innerHTML = voteCount
    });
  });

  $('.downvote').on ('click', function(e){
    event.preventDefault();
    var url = event.currentTarget.href;
    $.ajax({
      url: url,
      data: $(this).serialize()
    }).done(function(response){
      var id = response.split(":")[0];
      var voteCount = response.split(":")[1];
      $(id).children()[1].innerHTML = voteCount
    });
  });
});

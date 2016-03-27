//= require jquery
//= require jquery_ujs
//= require_tree .
$( document ).ready(function() {
  $('.upvote').on ('click', function(e){
    alert('ya');
    event.preventDefault();
    var voteObj = event.currentTarget
    var url = event.currentTarget.href;
    debugger
    $.ajax({
      url: url,
      data: $(this).serialize()
    }).done(function(response){
    debugger
    });
  });
});

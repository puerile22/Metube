$('document').ready(function() {
  if ($('body.videos').length) {
    console.log("Page generated by the videos controller.");

    //... video js code here
    $('.comment').click(function(e){
      e.preventDefault();
      var id = $('form:eq(0)').attr('class');
      var user_id = $('.user_id').val();
      var comment = $('#comment_comment').val();
      $.ajax({
        type:"POST",
        url:"/videos/"+id+"/comments",
        data:{video_id:id,comment:comment,user_id:user_id},
      }).done(function(html){
        var title = $(html).find('.comments').children('li').last();
        var comment = $(html).find('.comments').children('p').last();
        $('.comments').append(title);
        $('.comments').append(comment);
      });
    });
  }
});
var source = $('#search-result').html();
var template = Handlebars.compile(source);
$('document').ready(function(){
  $('#search').click(function(e){
    e.preventDefault();
    var query = $('input').val();
    $.ajax({
      type:'GET',
      url:"search/show",
      data:{query:query}
    }).done(function(data){
      $('.main').empty();
      for (var i = 0;i < data.items.length;i++) {
        var context={}
        context["title"] = data.items[i].snippet.title;
        context["img"] = data.items[i].snippet.thumbnails.high.url;
        context["id"] = data.items[i].id.videoId;
        var html = template(context);
        $('.main').append(html);
      }
    });
  });
});
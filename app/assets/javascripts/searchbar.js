$('document').ready(function(){
  $('.alert').click(function(e){
    e.preventDefault();
    var query = $('input').val();
    $.ajax({
      type:'GET',
      url:"search/show",
      data:{query:query}
    }).done(function(data){
      console.log(data);
    });
  });
});
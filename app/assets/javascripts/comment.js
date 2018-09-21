$(function(){
  function buildHTML(comment){
    var html = `<div class="media">
                  <div class="media-left"><img src ="${comment.user_avatar}" width="60" height="60" ></div>
                  <div class="media-body">
                    <h4 class="media-heading">${comment.user_name}</h4>
                    <p>${comment.text}</p>
                  </div>
                </div>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('#comment_list').append(html)
      $('.textbox').val('')
    })
    .fail(function(){
      alert('error');
    })
  })

  $('#commentlist__delete').click(function(e) {
    e.preventDefault();
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "DELETE",
      dataType: "json"
    })
    .done(function() {
      $('#comment_'+comment.id).fadeOut();
    })
    .fail(function() {
      alert("エラー");
    })
  })
})

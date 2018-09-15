$(function(){
  function buildHTML(comment){
    var html = `<p>
                  <div><img src ="${comment.user_avatar}" width="60" height="60" ></div>
                  <div>
                    <h4>${comment.user_name}</h4>
                    <p>${comment.text}</p>
                  </div>


                </p>`
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
      $('.comments_area').append(html)
      $('.textbox').val('')
    })
    .fail(function(){
      alert('error');
    })
  })
})

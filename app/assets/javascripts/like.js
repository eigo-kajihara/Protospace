$(function(){
  var $heart = $("#like-button img");
	$("#like-button").on("click", function(){
    var $likeSum = $("#like-sum")
		like(#{@post.id}, $(this), $likeSum, $heart)
	});

  function like(id, likeBtn, likeSum, heartImg) {
  if (likeBtn.hasClass("increment-button")) {
    $.ajax({url: "/api/like", type: "post", data: {prototype_id: id, dataType: "json"}})
    .done(function(data){
      likeBtn.removeClass("increment-button").addClass("decrement-button")
      heartImg.attr("src", "/assets/icon_heart.svg")
      likeSum.text(data["count"])
    }).fail(function(XMLHttpRequest) {
      if(XMLHttpRequest.status == "401" ){
        window.location.href = "/users/sign_in"
      } else {
        alert(XMLHttpRequest.status + "エラー")
      }
    })
  } else {
    $.ajax({url: "/api/like/" + id, type: "delete", data: {prototype_id: id, dataType: "json"}})
    .done(function(data){
      likeBtn.removeClass("decrement-button").addClass("increment-button")
      heartImg.attr("src", "/assets/icon_heart.svg")
      likeSum.text(data["count"])
    }).fail(function(XMLHttpRequest) {
      alert(XMLHttpRequest.status + "エラー")
    })
}
}
;
});
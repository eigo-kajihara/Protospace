// Main Thumbnailにプレビュー表示
function upload_main_image(field){
  fileLoad(field, function(e){
    $("#main_preview").attr("src", e.currentTarget.result).show();
    $(".cover-image-upload").css("background", "white");
  });
}

function fileLoad(field, onLoadCallback) {
  var file = $(field).prop("files")[0],
  reader = new FileReader();
  reader.onload = onLoadCallback;
  reader.readAsDataURL(file);
}

// Sub Thumbnailsにプレビュー表示
function upload_sub_image(field, i){
  fileLoad(field, function(e){
    console.log("this");
    $("#sub_" + i + "_preview").attr("src", e.currentTarget.result).show()
    $("#image_" + i + "_uploader").css("background", "white");
  });
}

function fileLoad(field, onLoadCallback) {
  var file = $(field).prop("files")[0],
  reader = new FileReader();
  reader.onload = onLoadCallback;
  reader.readAsDataURL(file);
}

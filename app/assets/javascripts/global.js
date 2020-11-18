$(document).ajaxError(function (e, xhr, settings, thrownError) {
  if (xhr.status == 401) { location.reload() }
});


$(function(){
  if( $("#posts_container").length > 0 ) {
    $('#posts_container .pagination a').on("click", function(){
      $.getScript(this.href);
      return false;
    });
  }
});

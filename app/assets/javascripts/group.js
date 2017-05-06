$(document).on('turbolinks:load', function() {
  $('.js-group').on('submit', function(e) {
    e.preventDefault();
    var formdata = new FormData($(this)[0]);

    $.ajax({
      type: 'POST',
      url: document.location.href,
      data: formdata,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
    })
    .fail(function(data) {
    });
  });
});

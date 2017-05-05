$(function() {

  function buildHTML(message) {
    var name = $('<p class="chat__user">').append(message.name);
    var date = $('<p class="chat__date">').append(message.date);
    var body = $('<p class="chat__content">').append(message.body);
    var image = $('<p class="chat__image">').append(message.image);
    var html = $('<div class="chat">').append(name).append(date).append(body).append(image);
    return html
  }

  $('.js-form').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.js-form__text-field');
    var fd = new FormData($(this)[0]);

    $.ajax({
      type: 'POST',
      url: document.location.href,
      data: fd,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      console.log(data)
      var chat = buildHTML(data);
      $('.chat-wrapper').append(chat);
      textField.val('');
    })
    .fail(function() {
      alert('非同期通信に失敗しました');
    });
  });
});

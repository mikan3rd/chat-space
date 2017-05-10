$(document).on('turbolinks:load', function() {

  function buildHTML(message) {
    var insertImage = '';
    if (message.image.url) {
      insertImage = `<img src="${message.image.url}">`;
    }
    var html = `
      <div class="chat">
        <p class="chat__user">${message.name}</p>
        <p class="chat__date">${message.date}</p>
        <p class="chat__content">${message.body}</p>
        ${insertImage}
      </div>`;
    return html
  }

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.js-form__text-field');
    var formdata = new FormData($(this).get(0));

    $.ajax({
      type: 'POST',
      url: document.location.href,
      data: formdata,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var chat = buildHTML(data);
      $('.chat-wrapper').prepend(chat);
      textField.val('');
    })
    .fail(function(data) {
      alert('メッセージを入力してください');
    });
  return false;
  });
});

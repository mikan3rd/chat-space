$(document).on('turbolinks:load', function() {

  function buildHTML(message) {
    var content = `
        <p class="chat__user">${message.name}</p>
        <p class="chat__date">${message.date}</p>
        <p class="chat__content">${message.body}</p>`;
    if (message.image) {
      html =`
      <div class="chat">
      ${content}
      <p class="chat__image">${message.image}</p>
      </div>`;
    } else {
      html = `
      <div class="chat">
      ${content}
      </div>`;
    }
    return html
  }

  $('.js-message').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.js-form__text-field');
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
      var chat = buildHTML(data);
      $('.chat-wrapper').prepend(chat);
      textField.val('');
    })
    .fail(function() {
      alert('非同期通信に失敗しました');
    });
  return false;
  });
});

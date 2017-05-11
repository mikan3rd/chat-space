$(document).on('turbolinks:load', function() {

  // メッセージ表示のHTMLを生成
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

  // メッセージ送信の非同期通信
  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.js-form__text-field');
    var formdata = new FormData($(this).get(0));

    $.ajax({
      type: 'POST',
      url: location.href,
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

  // メッセージ自動更新機能
  $('.chat-wrapper').ready(function() {
    setInterval(function() {
      $.ajax({
        type: 'GET',
        url: location.html,
        dataType: 'json'
      })
      .done(function(data) {
        console.log(data);
        var insertHTML = '';
        data.messages.forEach(function(message) {
          insertHTML += buildHTML(message);
        });
        $(this).html(insertHTML);
      })
      .fail(function(data) {
        console.log('自動更新に失敗しました');
      });
      }, 10 * 1000 );
  });
});

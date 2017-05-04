$(function() {

  function buildHTML(message) {
    var name = $('<p class="chat__user">').append(message.name);
    var
  }

  $('.js-form').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.js-form__text-field');
    var message = textField.val();

    $.ajax({
      type: 'POST',
      url: '/groups/:group_id/messages.json',
      data: {
        message: {
          body: message,
          image: message,
          group_id: message,
          user_id: message
        }
      },
      dataType: 'json'
    })
    .done(function(data) {
      var body = $('<p class="chat__content">').append(data.body);
      $('.chat').append(body);
      textField.val('');
    })
    .fail(function() {
      alert('非同期通信に失敗しました');
    });
  });
});

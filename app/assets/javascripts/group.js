$(document).on('turbolinks:load', function() {

  function buildHTML(user) {
    var html = `
    <p class="chat-group-user__name">${user.name}</p>
    `
    return html
  }

  $('#user-search-field').on('keyup', function() {
    $.ajax({
      type: 'GET',
      url: '/groups/search.json',
      // processData: false,
      // contentType: false,
      data: {
        name: $(this).val()
      },
      dataType: 'json'
    })
    .done(function(data) {
      console.log(data)
      var insertHTML = "";
      data.forEach(function(user) {
        insertHTML += buildHTML(user);
      });
      $('#user-search-result').html(insertHTML);
    })
    .fail(function(data) {
      console.log("検索に失敗しました");
    });
  });

  $('#user-search-result').on('click', function() {

  });
});

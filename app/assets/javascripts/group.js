$(document).on('turbolinks:load', function() {

// ユーザー検索時に表示されるHTMLを生成
  function buildSearchHTML(user) {
    var html =`
      <div class="chat-group-user clearfix">
        <p class="chat-group-user__name">
          ${user.name}</p>
        <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id=" ${user.id}" data-user-name=" ${user.name} ">追加
        </a>
      </div>`;
    return html
  }

// ユーザー追加ボタンクリック時に追加されるHTMLの生成
  function buildMemberHTML(id, name) {
    var html = `
    <div class="chat-group-user clearfix">
      <input type="hidden" name="group[user_ids][]" value="${id}">
      <p class="chat-group-user__name">${name}</p>
      <a class="user-search-remove chat-group-user__btn chat-group-user__btn--remove" data-user-id="${id}">削除</a>
    </div>`;
    return html
  }

// インクリメンタルサーチ
  $('#user-search-field').on('keyup', function() {
    $.ajax({
      type: 'GET',
      url: '/groups/search.json',
      data: {
        name: $(this).val()
      },
      dataType: 'json'
    })
    .done(function(data) {
      console.log(data);
      var insertHTML = "";
      data.forEach(function(user) {
        insertHTML += buildSearchHTML(user);
      });
      $('#user-search-result').html(insertHTML);
    })
    .fail(function(data) {
      console.log("検索に失敗しました");
    });
  });

// メンバーの追加
  $('#user-search-result').on('click', '.user-search-add', function(e) {
    e.preventDefault();
    var id = $(this).data('userId');
    var name = $(this).data('userName');
    var insertHTML = buildMemberHTML(id, name);
    $('#chat-group-users').append(insertHTML);
    $(this).parent('.chat-group-user').remove();
  });
});

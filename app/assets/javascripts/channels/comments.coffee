App.comments = App.cable.subscriptions.create "CommentsChannel",
  connected: (data) ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#comments').append("
      <div class=\"card bg-light\">
          <div class=\"card-body\">
              <p>#{data.message.content}</p>
          </div>
          <div class=\"card-footer\">
              <p class=\"float-left\">Posted by: <strong></strong></p>
              <a href=\"/comments/#{data.message.id}/edit\">
                <button class=\"btn btn-primary btn-secondary float-right\" >Edit</button>
              </a>
              <a data-confirm=\"Are you sure?\" rel=\"nofollow\" data-method=\"delete\" href=\"/comments/#{data.message.id}\">
                <button class=\"btn btn-primary btn-danger float-right\">Delete</button>
              </a>
          </div>
      </div>
    ")

  comment: (msg) ->
    @perform 'comment', message: msg

$(document).on 'keypress', '[data-behavior~=comments_comment]', (event) ->
  if event.keyCode is 13
    App.comments.comment(post_id: $("#post_id")[0].value, user_id: $("#user_id")[0].value , content: event.currentTarget.value)
    event.target.value = ""
    event.preventDefault()

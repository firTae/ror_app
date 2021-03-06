refreshComments = (data) ->
  $("div#comments-block").html(JST['comments']({comments: data}))

$ ->

  $.ajax '/comments_by_post/' + gon.post_id + '.json',
    type: 'GET',
    success: (data) ->
      refreshComments(data)

  $("a#ajax_submit").click ->
    $.ajax '/comments.json',
      type: 'POST',
      data:
        comment:
          title: $("input#comment_title")[0].value,
          content: $("textarea#comment_content")[0].value,
      success: (data) ->
        refreshComments(data)

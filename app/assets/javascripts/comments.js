// The following is for new comments on recipe show page:
//    * append comment to show page

$(function() {
  appendComment();
})

function appendComment() {
  $("#new_comment").submit(function(e) {
    $.ajax({
      method: "POST",
      url: this.action,
      data: $(this).serialize(),
      success: function(response) {
        let comment = new Comment(response);

        comment.renderComments();
        $(".commentBox").val("");

      }
    })


    e.preventDefault();
  })
}

function Comment(data) {
  this.body = data.body;
  this.user_name = data.user.name;
  this.user_id = data.user.id;
  this.created_at = data.created_at;
}

Comment.prototype.renderComments = function() {
  let html = "";

  html += `
  <div class="has-text-grey-dark has-text-weight-bold is-italic ">
  "${ this.body }"
  </div>
  <div class="is-size-7 has-text-grey-lighter">
  - <a class="user-link" href="/users/${this.user_id}/recipes">${this.user_name}</a> (Now)
  </div>
  <br>
  `;

  $("div#newComment").append(html);
}

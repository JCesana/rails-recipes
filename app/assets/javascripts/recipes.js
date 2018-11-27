// The following is for the recipe index page:
//    * append description to recipe

$(function() {
  appendDescription();
  nextRecipe();
  previousRecipe();
})

function appendDescription() {
  $(".seeDescription").on('click', function(e) {
    let id = $(this).data("id");

    e.preventDefault();

    $.get('/recipes/' + id + '.json', function(recipe) {
      const description = recipe.description;
      $("#recipe-" + recipe.id + "-description").append(description);

      // adjust recipe stats back after description gets appended
      let stats = $(".stats-" + recipe.id);
      stats.css("bottom", "130px");
    })

    $(this).remove();
  })
}

function nextRecipe() {
  $(".js-next-recipe").on('click', function(e) {
    const id = $(".js-next-recipe").data("id")
    $.get("/recipes/" + id + "/next", function(response) {
      loadRecipe(response);
    })
    e.preventDefault();
  })
}

function previousRecipe() {
  $(".js-previous-recipe").on('click', function(e) {
    const id = $(".js-previous-recipe").data("id")
    $.get("/recipes/" + id + "/previous", function(response) {
      loadRecipe(response);
    })
    e.preventDefault();
  })
}

function loadRecipe(data) {
  // change URL to new route
  history.pushState({}, "", "/recipes/" + data.id)

  // reset id's of top arrow buttons
  $(".js-previous-recipe").attr("data-id", data["id"]);
  $(".js-next-recipe").attr("data-id", data["id"]);

  // set title
  let divTitle = $("#js-recipe-title")
  divTitle.text(data.title);

  // set description
  let description = $(".description")
  description.text(data.description);

  // set 'Submitted By' link
  let subbmitedBy = $(".js-subbmited-by")
  subbmitedBy.html('Submitted by <a class="user-link" href="/users/' + data.user.id + '/recipes">' + data.user.name + '</a>');

  // set image
  $(".recipe_image").html(`<img src='${data.image_url}'>`);

  // set ingredients
  let ingredientsHtml = "";
  let measurements = data.recipe_ingredients;
  let ingredients = data.ingredients;

  ingredients.forEach(function(ingredient, i) {
    ingredientsHtml += `<li>${measurements[i].quantity} ${measurements[i].unit} ${ingredient.name}</li>`;
  })
  $("#js-ingredients-list").html(ingredientsHtml);

  // set directions
  let directionsHtml = "";
  let directions = data.directions;

  directions.forEach(function(direction) {
    directionsHtml += `<li>${direction.step}</li>`;
  })
  $("#js-directions-list").html(directionsHtml);

  // set comments
  let comments = data.comments;
  let commentsHtml = "";

  commentsHtml += `<p class="title has-text-centered">Comments</p><br>`;

  comments.forEach(function(comment) {
    commentsHtml += `<div class="has-text-grey-dark has-text-weight-bold is-italic ">${comment.body}</div>`
    commentsHtml += `<div class="is-size-7 has-text-grey-lighter">-<a class="user-link" href="/users/${comment.user.id}/recipes">${comment.user.name}</a> (${comment.created_at})</div><hr>`
  })

  $(".js-comments").html(commentsHtml);
}

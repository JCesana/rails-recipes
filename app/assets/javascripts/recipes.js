// The following is for the recipe index page:
//    * append description to recipe

$(function() {
  appendDescription();
  nextRecipe();
  previousRecipe();
  processUserRecipes();
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
    const id = $(".js-next-recipe").attr("data-id")
    $.get("/recipes/" + id + "/next", function(recipe) {
      loadRecipe(recipe);
    })
    e.preventDefault();
  })
}

function previousRecipe() {
  $(".js-previous-recipe").on('click', function(e) {
    const id = $(".js-previous-recipe").attr("data-id")

    $.get("/recipes/" + id + "/previous", function(recipe) {
      loadRecipe(recipe);
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

  // set or delete 'Edit' and 'Delete' buttons, depending if user is owner
  let buttonsHtml = "";

  // remove 'Edit' and 'Delete' if not signed in, or not owner
  if (data.user.current_user == null || data.user.id !== data.user.current_user.id) {
    $(".js-edit-button").remove();
    $(".js-delete-button").remove();
  } else {
    buttonsHtml += `
      <a class="js-edit-button button is-light" href="/recipes/${data.id}/edit">Edit</a>
      <a data-confirm="Are you sure?" class="js-delete-button button is-light" rel="nofollow" data-method="delete" href="/recipes/${data.id}">Delete</a>
      `;
  }

  $(".js-admin-buttons").append(buttonsHtml)
}

function processUserRecipes() {
  $(".js-view-recipes").one('click', function(e) {
    const userId = $(".js-view-recipes").attr("data-user-id");

    $.get('/users/' + userId + '/recipes.json', function(response) {
      let recipes = response;
      appendRecipeIndex(response);
    })

    e.preventDefault();
  })
}

function appendRecipeIndex(recipes) {
  let indexHtml = "";

  // itterate recipes json by 3 to accommodate 3 columns
  for (var i = 0; i < (recipes.length + 3); i += 3) {
    let recipe1;
    let recipe2;
    let recipe3;

    if (recipes[i]) {
      recipe1 = recipes[i];
    }

    if (recipes[i + 1]) {
      recipe2 = recipes[i + 1];
    }
    if (recipes[i + 2]) {
      recipe3 = recipes[i + 2];
    }

    indexHtml += `<div class="columns">`

    if (recipe1) {
      indexHtml += `
      <div class="column is-one-third">
        <div class="recipe">
          <div class="image_wrapper">
            <h2><strong><a href="/recipes/${recipe1.id}">${recipe1.title}</a></strong></h2>
            <a href="/recipes/${recipe1.id}">
              <img src="${recipe1.image_url}">
            </a>
          </div>
          <div class="recipe-stats-rendered">
            <i class="far fa-comment" title="Comments"></i>${recipe1.comments.length}
            &nbsp;
            <i class="fas fa-utensils" title="Ingredients"></i>${recipe1.ingredients.length}
          </div>
          <div id="recipe-${recipe1.id}-description">${recipe1.description}</div>
        </div>
      </div>
      `
    }

    if (recipe2) {
      indexHtml += `
      <div class="column is-one-third">
        <div class="recipe">
          <div class="image_wrapper">
            <h2><strong><a href="/recipes/${recipe2.id}">${recipe2.title}</a></strong></h2>
            <a href="/recipes/${recipe2.id}">
              <img src="${recipe2.image_url}">
            </a>
          </div>
          <div class="recipe-stats-rendered">
            <i class="far fa-comment" title="Comments"></i>${recipe2.comments.length}
            &nbsp;
            <i class="fas fa-utensils" title="Ingredients"></i>${recipe2.ingredients.length}
          </div>
          <div id="recipe-${recipe2.id}-description">${recipe2.description}</div>
        </div>
      </div>
      `
    }

    if (recipe3) {
      indexHtml += `
      <div class="column is-one-third">
        <div class="recipe">
          <div class="image_wrapper">
            <h2><strong><a href="/recipes/${recipe3.id}">${recipe3.title}</a></strong></h2>
            <a href="/recipes/${recipe3.id}">
              <img src="${recipe3.image_url}">
            </a>
          </div>
          <div class="recipe-stats-rendered">
            <i class="far fa-comment" title="Comments"></i>${recipe3.comments.length}
            &nbsp;
            <i class="fas fa-utensils" title="Ingredients"></i>${recipe3.ingredients.length}
          </div>
          <div id="recipe-${recipe3.id}-description">${recipe3.description}</div>
        </div>
      </div>
      `
    }

    indexHtml += `</div>`
  }

  $("#js-recipes").html(indexHtml);
}

// testing

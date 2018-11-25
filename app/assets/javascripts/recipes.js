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
  $(".js-next-recipe").on('click', function() {
    alert("Next!");
  })
}

function previousRecipe() {
  $(".js-previous-recipe").on('click', function() {
    alert("Previous!");
  })
}

// The following is for the recipe index page:
//    * append description to recipe

$(function() {
  appendDescription();
})


function appendDescription() {
  $("#seeDescription").on('click', function() {
    alert("TEST: appending description!");
  })
}

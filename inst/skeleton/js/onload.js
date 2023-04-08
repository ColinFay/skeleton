$(document).ready(function () {
  $(".row-nav-content-items").hide();
  $(".row-nav-content-items").first().show();
  $(".navbar-link").first().click();
  $(".navbar-link").first().addClass("clicked");
});

const showContent = function (id, that) {
  $("a.navbar-link").removeClass("clicked");
  $(that).addClass("clicked");
  $(".row-nav-content-items").hide();
  $(`#${id}`).show();
  $(`#${id}`).trigger("show")
  $(`#${id}`).trigger("shown")
}
$(document).ready(function () {
  $(".row-nav-content-items").hide();
  $(".row-nav-content-items").first().show();
  $(".navbar-link").first().click();
  $(".navbar-link").first().addClass("clicked");

  // from https://github.com/dev-ggaurav/responsive-hamburger-tutorial
  const hamburger = document.querySelector(".hamburger");
  const navMenu = document.querySelector(".nav-menu");
  const navLink = document.querySelectorAll(".navbar-link");

  hamburger.addEventListener("click", function () {
    hamburger.classList.toggle("active");
    navMenu.classList.toggle("active");
  });

  navLink.forEach(n => n.addEventListener("click", function () {
    hamburger.classList.remove("active");
    navMenu.classList.remove("active");
  }));
});

const showContent = function (id, that) {
  $("a.navbar-link").removeClass("clicked");
  $(that).addClass("clicked");
  $(".row-nav-content-items").hide();
  $(`#${id}`).show();
  $(`#${id}`).trigger("show")
  $(`#${id}`).trigger("shown")
}

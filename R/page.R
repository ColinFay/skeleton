#' @export
#' @importFrom htmltools tagList tags HTML includeCSS
#' @importFrom glue glue
sk_page <- function(...){
  tagList(
    tags$head(
      HTML('<meta charset="utf-8">'),
      HTML(glue('<meta name="description" content="">')),
      HTML(glue('<meta name="author" content="">')),
      HTML('<meta name="viewport" content="width=device-width, initial-scale=1">')

    ),
    tags$body(
      includeCSS(system.file("css/font.css", package = "skeleton")),
      includeCSS(system.file("css/normalize.css", package = "skeleton")),
      includeCSS(system.file("css/skeleton.css", package = "skeleton")),
      includeCSS(system.file("css/forapp.css", package = "skeleton")),
      tags$div(class = "container", ...),
      #tags$a(href="#", id="back-to-top", title="Back to top", "GO"),
      tags$script('$( document ).ready(function() {
                $( ".row" ).hide();
                $( ".row" ).first().show();
                  });')
      )
  )
}
#' @export
#' @importFrom htmltools tags h2
#'
sk_header <- function(title,...){
  tags$section(
    class = "header",
    h2(class = "title", title),
    ...
  )
}
#' @importFrom htmltools tags
#' @export
sk_nav <- function(...){
  tagList(
    tags$nav(
      class="navbar",
      tags$div(
        class="container",
        tags$ul(
          class = "navbar-list",
          ...
        )
      )
    )
  )
}
#' @export
#' @importFrom htmltools tags

sk_nav_item <- function(id, label) {
  tags$nav(
    class = "navbar-item",
    tags$a(
      class = "navbar-link",
      href = "javascript:void(0)",#paste0("#",id),
      onclick = glue::glue('$( ".row" ).hide();$( "#{id}" ).show();$( "#{id}" ).trigger("show");$( "#{id}" ).trigger("shown")'),
      label
    )
  )
}

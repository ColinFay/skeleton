#' @export
#' @importFrom htmltools tags
sk_button <- function(id, label){
  tags$button(
    id = id,
    type = "button",
    class = "btn btn-default action-button",
    "plop"
  )
}

#' @export
#' @importFrom htmltools tags
sk_button_primary <- function(id, label){
  tags$button(
    id = id,
    type = "button",
    class = "button-primary btn btn-default action-button",
    "plop"
  )
}
#' @export
sk_select_input <- shiny::selectInput
#' @export
sk_text_input <- shiny::textInput
#' @export
sk_area_input <- shiny::textAreaInput

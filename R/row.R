#' @export
sk_row <- function(id, ...){
  tags$div(
    id = id,
    class = "row",
    ...
  )
}

#' @export
sk_col <- function(id, width, ...){
  tags$div(
    id = id,
    class = to_letter(width),
    ...
  )
}

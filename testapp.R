.rs.api.documentSaveAll() # close and save all open file
try(suppressWarnings(lapply(paste("package:", names(sessionInfo()$otherPkgs), sep = ""), detach, character.only = TRUE, unload = TRUE)), silent = TRUE)
rm(list=ls(all.names = TRUE))
library(shiny)
rm(ui);rm(server)
devtools::load_all()
library(glue)
library(dygraphs)
library(prenoms)
library(tidyverse)
draw_names_dygraph <- function(names){
  prenoms %>%
    group_by(year,name) %>%
    summarise(total = sum(n))    %>%
    filter(name %in% names) %>%
    spread(key = name,value =total) %>%
    dygraph()

}

prenoms_uniques <- unique(prenoms_france$name)
ui <- sk_page(
  # Header
  sk_header(title = "Les prénoms en France"),
  sk_nav(
    sk_nav_item("one", "Popularités Prénoms")
  ),
  sk_row(
    "one",
    sk_col(
      "one_col",
      width = 3,
      h2("Choisir un prénom"),
      selectInput("choix", "Prénom(s)",
                  selected = c("Vincent", "Diane", "Colin", "Sebastien", "Cervan"),
                  choices = prenoms_uniques,
                  multiple = TRUE)
    ),
    sk_col(
      "one_col",
      width = 9,
      dygraphOutput("dy")
    )
  )
)

server <- function(input, output, session) {
  observeEvent(input$choix, {
    output$dy <- renderDygraph({
      draw_names_dygraph(input$choix)
    })
  })

}

shinyApp(ui, server)

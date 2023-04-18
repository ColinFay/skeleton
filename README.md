
<!-- README.md is generated from README.Rmd. Please edit that file -->

# skeleton

<!-- badges: start -->

[![R-CMD-check](https://github.com/ColinFay/skeleton/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ColinFay/skeleton/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of skeleton is to [Skeleton CSS](http://getskeleton.com/) for
`{shiny}`.

## Installation

You can install the development version of `{skeleton}` from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("ColinFay/skeleton")
```

# skeleton

## About

You’re reading the doc about version : 0.0.0.9001

This README has been compiled on the

``` r
Sys.time()
#> [1] "2023-04-18 12:56:49 CEST"
```

Here are the test & coverage results :

``` r
devtools::check(quiet = TRUE)
#> ℹ Loading skeleton
#> ── R CMD check results ──────────────────────────────── skeleton 0.0.0.9001 ────
#> Duration: 12.3s
#> 
#> 0 errors ✔ | 0 warnings ✔ | 0 notes ✔
```

``` r
covr::package_coverage()
#> skeleton Coverage: 96.69%
#> R/sk_page.R: 81.82%
#> R/golem_hook.R: 100.00%
#> R/sk_buttons.R: 100.00%
#> R/sk_deps.R: 100.00%
#> R/sk_inputs.R: 100.00%
#> R/sk_nav.R: 100.00%
#> R/sk_utils.R: 100.00%
```

# Example

## Basic app

``` r
library(shiny)
library(skeleton)

ui <- sk_page(
  h1("Hello world"),
  sk_row(
    sk_col(6, "Hello"),
    sk_col(6, "World")
  ),
  sk_row(
    plotOutput("plot1")
  )
)

server <- function(input, output) {
  output$plot1 <- renderPlot({
    plot(mtcars)
  })
}

shinyApp(ui, server)
```

## Built-in dashboard

``` r
fusen::inflate(
  flat_file = "dev/flat_navbar.Rmd",
  vignette_name = NA,
  check = FALSE
)
library(shiny)
pkgload::load_all()
options(shiny.port = httpuv::randomPort())
ui <- sk_page(
  sk_header(
    h2("A dead simple, responsive boilerplate."),
  ),
  sk_nav(
    sk_nav_item(
      id = "one",
      title = "ONE",
      ui = sk_row(
        sk_col(
          6,
          "Hello plot1"
        ),
        sk_col(
          6,
          plotOutput("plot1")
        )
      )
    ),
    sk_nav_item(
      id = "two",
      title = "TWO",
      ui = sk_row(
        sk_col(
          6,
          plotOutput("plot2")
        ),
        sk_col(
          6,
          "Hello plot2"
        ),
      )
    ),
    sk_nav_item(
      id = "three",
      title = "THREE",
      ui = sk_row(
        sk_col(
          6,
          plotOutput("plot3")
        ),
        sk_col(
          6,
          "Hello plot3"
        ),
      )
    )
  )
)
shinyApp(ui, function(input, output) {
  output$plot1 <- renderPlot({
    plot(mtcars)
  })
  output$plot2 <- renderPlot({
    plot(airquality)
  })
  output$plot3 <- renderPlot({
    plot(pressure)
  })
})
```

## With golem

You can get a boilerplate of a page or a dashboard when creating an app
with golem, using the built-in golem hooks:

``` r
golem::create_golem(
  "skboilerplate",
  project_hook = skeleton::ghook_sk_dashboard
)
golem::create_golem(
  "skdashboard",
  project_hook = skeleton::ghook_sk_boilerplate
)
```

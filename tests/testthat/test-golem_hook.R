# WARNING - Generated by {fusen} from /dev/flat_golem_hook.Rmd: do not edit by hand

options("repos" = "https://cran.rstudio.com")
golem::install_dev_deps(TRUE)
is_golem <- function(path = getwd()) {
  files_from_shiny_example <- grep(
    "^(?!REMOVEME).*",
    list.files(
      system.file(
        "shinyexample",
        package = "golem"
      ),
      recursive = TRUE
    ),
    perl = TRUE,
    value = TRUE
  )
  files_from_shiny_example <- grep(
    "favicon.ico",
    files_from_shiny_example,
    perl = TRUE,
    value = TRUE,
    invert = TRUE
  )
  all(files_from_shiny_example %in% list.files(path, recursive = TRUE))
}
test_that("skboilerplate works", {
  skip_if_not_installed("golem")
  old <- setwd(tempdir())
  on.exit(setwd(old))
  unlink("skboilerplate", recursive = TRUE)
  golem::create_golem(
    "skboilerplate",
    project_hook = ghook_sk_boilerplate
  )
  expect_true(
    any(
      grepl(
        "sk_page",
        readLines("R/app_ui.R")
      )
    )
  )
  expect_true(
    any(
      grepl(
        "skeleton",
        readLines("R/app_ui.R")
      )
    )
  )
  expect_true(
    is_golem(".")
  )
})
test_that("skdashboard works", {
  skip_if_not_installed("golem")
  old <- setwd(tempdir())
  on.exit(setwd(old))
  unlink("skdashboard", recursive = TRUE)
  golem::create_golem(
    "skdashboard",
    project_hook = ghook_sk_dashboard
  )
  expect_true(
    file.exists("R/mod_tab1.R")
  )
  expect_true(
    file.exists("R/mod_tab2.R")
  )
  expect_true(
    any(
      grepl(
        "mod_tab1_ui",
        readLines("R/app_ui.R")
      )
    )
  )
  expect_true(
    any(
      grepl(
        "skeleton",
        readLines("R/app_ui.R")
      )
    )
  )
  expect_true(
    is_golem(".")
  )
})

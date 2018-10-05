to_letter <- function(num){
  switch (as.character(num),
          "1" = "one column",
          "2" = "two columns",
          "3" = "three columns",
          "4" = "four columns",
          "5" = "five columns",
          "6" = "six columns",
          "7" = "seven columns",
          "8" = "eight columns",
          "9" = "nine columns",
          "10" = "ten columns",
          "11" = "eleven columns",
          "12" = "twelve columns"
  )
}

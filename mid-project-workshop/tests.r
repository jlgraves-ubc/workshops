library(tidyverse)
library(testthat)
library(digest)

test_1 <- function() {
  test_that("Solution is incorrect", {
    expect_equal(digest(tolower(answer1)), "af31d61b8795057ce1ce2e040685107c")
  })
  print("Success!")
}

test_2_fails <- 0

test_2 <- function() {
  hash <- digest(tolower(answer1))
    
   out <- case_when(
        hash == "af31d61b8795057ce1ce2e040685107c" ~ "You got it!  Success!", #character
        hash == "4ab62c35e9c5a9dcfcf530ff02a71bed" ~ "Not quite! What do we call strings in R?", #string
        hash == "c0b945d249d6c868c385fdd23d51daff" ~ "Nope! Remember to fill in the ...!", #...
        hash == "46606ee201b428a3fa6c8a0d3d9e671c" ~ "Nope!  What does the as.character function do?", #numeric
        hash == "032bd1f4d0b78111f60eee017b148f2d" ~ "Nope!  What does the as.character function do?", #integer
        TRUE ~ "Nope!  Try again" #all others 
        )
    print(out)
    
    if(out == "You got it!  Success!") { 
        test_2_fails <<- 0
    } else { test_2_fails <<- test_2_fails + 1}
    
    if(test_2_fails > 3) { 
        print("Hint: you can check the type of a variable with the class function")
    }
    
}

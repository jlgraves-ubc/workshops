library(testthat)
library(digest)

hello_world = function() {

print("Hello world from this demo script")
}


test_1 <- function() {
  test_that("Solution is incorrect", {
    expect_equal(digest(answer1), "965afedbbdb8b25c39383d8c22b5cdc2")
  })
  print("Success!")
}

test_2 <- function() {
  test_that("Solution is incorrect", {
    expect_equal(digest(answer2), "d6855f3722ecd03c11a12c243103fbc2")
  })
  print("Success!")
}

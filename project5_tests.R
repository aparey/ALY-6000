#Project 1 Tests
library(pacman)

p_load(testthat)


#Test Problem 6
test_that("Testing Problem 6", {
  expect_equal(prob6_result, .192,tolerance = 1e-3)
})

#Test Problem 7
test_that("Testing Problem 7", {
  expect_equal(prob7_result, .715,tolerance = 1e-3)
})

#Test Problem 8
test_that("Testing Problem 8", {
  expect_equal(prob8_result, .189,tolerance = 1e-3)
})

#Test Problem 9
test_that("Testing Problem 9", {
  expect_equal(prob9_result, .036 ,tolerance = 1e-3)
})

#Test Problem 10
test_that("Testing Problem 10", {
  expect_equal(prob10_result, .382,tolerance = 1e-3 )
})

#Test Problem 11
test_that("Testing Problem 11", {
  expect_equal(prob11_result, .1253814,tolerance = 1e-4 )
})
#Test Problem 12
test_that("Testing Problem 12", {
  expect_equal(prob12_result, .001324826 ,tolerance = 1e-5)
})
#Test Problem 13
test_that("Testing Problem 13", {
  expect_equal(prob13_result, .1244525, tolerance = 1e-3)
})

#Test Problem 14
test_that("Testing Problem 14", {

  expect_equal(my_factorial(3), 6)
  expect_equal(my_factorial(0), 1)
  expect_equal(my_factorial(6), 720)
})

#Test Problem 18
test_that("Testing Problem 18", {
  expect_equal(prob18_result,0.3456,tolerance = 1e-3 )
})

#Test Problem 19
test_that("Testing Problem 19", {
  expect_equal(prob19_result,0.4752 ,tolerance = 1e-3)
})

#Test Problem 20
test_that("Testing Problem 20", {
  expect_equal(prob20_result, 0.8704,tolerance = 1e-3)
})

#Test Problem 22
test_that("Optional - Testing Problem 22", {
  expect_equal(prob22_result, .007415771,tolerance = 1e-4)
})

#Test Problem 23
test_that("Optional Testing Problem 23", {
  expect_equal(prob23_result, .9998474,tolerance = 1e-3)
})

#Test Problem 24
test_that("Optional Testing Problem 24", {
  expect_equal(prob24_result, 100)
})


test_that("Internet connection is available", {
  expect_true(RCurl::url.exists("https://github.com/brunomioto/feowR"))
})

test_that("Function read_feow works correctly with internet", {
  skip_if_not(RCurl::url.exists("https://github.com/brunomioto/feowR"),
              message = "No internet connection to test read_feow function")

  result <- read_feow(overwrite = TRUE)
  expect_s3_class(result, "sf")
  expect_true(nrow(result) > 0)
})

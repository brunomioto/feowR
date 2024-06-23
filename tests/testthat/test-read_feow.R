test_that("Internet connection is available", {
  expect_true(RCurl::url.exists("https://github.com/brunomioto/feowR"))
})

test_that("Function read_feow works correctly with internet", {

  skip_if_not(RCurl::url.exists("https://github.com/brunomioto/feowR"),
              message = "No internet connection to test read_feow function")

  result <- read_feow()
  expect_s3_class(result, "sf")
  expect_true(nrow(result) > 0)
})

# url.exists <- NULL
# test_that("Function read_feow fails without internet", {
#   local_mocked_bindings(
#     # url.exists <- NULL
#     url.exists = function(url) FALSE
#   )
#    expect_error(read_feow())
#
# })

test_that("Internet connection is available", {

  test_internet <- function(url){

    website <- httr::GET(url)

    return(website$status_code)

  }

  expect_equal(test_internet("https://github.com/brunomioto/feowR"), 200)

})

test_that("Function read_feow works correctly with internet", {

  result <- read_feow()
  expect_s3_class(result, "sf")
  expect_true(nrow(result) > 0)

})

# url.exists <- NULL
# test_that("Function read_feow fails without internet", {
#   local_mocked_bindings(
#     # url.exists <- NULL
#     test_internet = function(url) 404
#   )
#    expect_error(read_feow())
#
# })

test_that("Internet connection is available", {

  skip_if_offline(host = "r-project.org")

  expect_true(curl::has_internet())

})

test_that("Function read_feow() works correctly with internet", {

  skip_if_offline(host = "r-project.org")

  result <- read_feow()
  expect_s3_class(result, "sf")
  expect_true(nrow(result) > 0)

})

test_that("read_feow() notes the absence of internet", {
    local_mocked_bindings(is_internet_down = function(...) TRUE)
    expect_message(read_feow(), "Check your internet connection")
})

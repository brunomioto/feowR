test_that("read_feow returns an sf object", {
  result <- feowR::read_feow()

  expect_s3_class(result, "sf")
})

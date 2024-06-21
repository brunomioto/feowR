test_that("ecoregion_list returns a df", {

  result <- feowR::ecoregions_list

  expect_s3_class(result, "data.frame")

})

test_that("ecoregion_list has 426 rows and 4 columns", {

  result <- feowR::ecoregions_list

  expect_equal(nrow(result), 426)
  expect_equal(ncol(result), 4)
})

#' Read FEOW HydroSheds data
#'
#' This function downloads and reads the FEOW ecoregions data from the
#' `brunomioto/feowR` repository.
#'
#' @author The Nature Conservancy and World Wildlife Fund, Inc.
#' @source https://www.feow.org/ecoregions/list
#'
#' @param overwrite Logical (default `FALSE`). If TRUE, any existing file will be overwritten.
#'
#' @return A spatial data frame containing the FEOW ecoregions polygons.
#' @export
#'
#' @examples
#' feow_data <- read_feow()
read_feow <- function(overwrite = FALSE) {

  #check internet connection
  test_internet <- function(url){

    website <- httr::GET(url)

    return(website$status_code)

  }

  if(test_internet("https://github.com/brunomioto/feowR") != 200){
    cli::cli_abort("Check your internet connection")
  }

  temp <- base::tempdir()
  temp2 <- base::tempfile()

  piggyback::pb_download("feow_hydrosheds.zip",
                         repo = "brunomioto/feowR",
                         dest = temp,
                         overwrite = overwrite)

  utils::unzip(zipfile = paste0(temp,"/feow_hydrosheds.zip"),
               exdir = temp2)

  sf_file <- sf::read_sf(temp2)

  sf::st_crs(sf_file)  <-  4326

  return(sf_file)

}

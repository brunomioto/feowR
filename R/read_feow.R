#' Read FEOW HydroSheds data

#' This function downloads and reads the FEOW HydroSheds data from the
#' `brunomioto/feowR` repository. It returns a spatial data frame containing
#' the FEOW HydroSheds catchment polygons.

#' @return A spatial data frame containing the FEOW HydroSheds catchment polygons.
#' @export

#' @examples
#' feow_data <- read_feow()
read_feow <- function() {

  temp <- base::tempdir()
  temp2 <- base::tempfile()

  piggyback::pb_download("feow_hydrosheds.zip",
             repo = "brunomioto/feowR",
             dest = temp)

  utils::unzip(zipfile = paste0(temp,"/feow_hydrosheds.zip"),
        exdir = temp2)

  sf::read_sf(temp2)

}

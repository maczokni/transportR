#' Get TfGM carparks Function
#'
#' This function returns a dataframe of carparks in Greater Manchester
#' This dataset contains car park names, state (giving an indication of whether it is open or closed), capacity and real-time occupancy for selected car parks in the districts of Manchester, Stockport and Wigan only.
#' Metrolink Park & Ride sites will be available shortly.
#' Function also exracts longitude and latitude into separate columns from WKT column
#' @param readpath the path where you saved the file with the api key, defaults to working directory
#' @keywords transport, api, uk, tfgm, carparks
#' @export
#' @examples
#' carpark_df <- get_tfgm_carparks()

get_tfgm_carparks <- function(readpath = getwd()){

  filename <- paste0(readpath, "/", "tfgmkey.txt")
  api_key <-readChar(filename, file.info(filename)$size)

  #get the data
  req <- GET("https://api.tfgm.com/odata/Carparks?$expand=Location&$top=5000",
           add_headers("Ocp-Apim-Subscription-Key" = api_key))
  stop_for_status(req)

  #parse the data
  thing <- content(req, as='text', encoding = "UTF-8")
  thing2 <- fromJSON(thing)

  #finally get coordinates to columns from the WKT
  thing2$value$lon <- as.numeric(paste0("-",gsub(".*?([0-9]+[.][0-9]+).*", "\\1", thing2$value$Location$LocationSpatial$Geography$WellKnownText)))
  thing2$value$lat <- as.numeric(gsub(".* ([-]*[0-9]+[.][0-9]+).*", "\\1", thing2$value$Location$LocationSpatial$Geography$WellKnownText))

  return(thing2)

}

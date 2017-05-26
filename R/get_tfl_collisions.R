#' Get TfL collisions Function
#'
#' This function returns a dataframe of collisions in London
#' This dataset contains car park names, state (giving an indication of whether it is open or closed), capacity and real-time occupancy for selected car parks in the districts of Manchester, Stockport and Wigan only.
#' Metrolink Park & Ride sites will be available shortly.
#' Function also exracts longitude and latitude into separate columns from WKT column
#' @param year the year for which you want to retreive collisions data for
#' @param readpath the path where you saved the file with the api key, defaults to working directory
#' @param isFirewall specify if you are behind a corporate firewall that might cause issues. Defaults to FALSE
#' @keywords transport, api, uk, tfl, collisions
#' @export
#' @examples
#' collisions_df <- get_tfl_collisions("2015")

get_tfl_collisions <- function(year, readpath = getwd(), isFirewall=FALSE){

  filename <- paste0(readpath, "/", "tflkey.txt")
  api_auth <-readChar(filename, file.info(filename)$size)
  query_string <- paste0("https://api.tfl.gov.uk/AccidentStats/", year, "?", api_auth)

  if(isFirewall==TRUE){
    l = readLines(queryString, encoding="UTF-8", warn=FALSE)
  } else {
    l = query_string
  }

  #get the data
  d = fromJSON(l)
  accidents <- data.frame(lapply(as.data.frame(d), as.character), stringsAsFactors=FALSE)

  #also make sure data is in date format
  accidents$date2 <- as.Date(accidents$date, "%Y-%m-%d")

  return(accidents)

}

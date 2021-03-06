% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_tfl_collisions.R
\name{get_tfl_collisions}
\alias{get_tfl_collisions}
\title{Get TfL collisions Function}
\usage{
get_tfl_collisions(year, readpath = getwd(), isFirewall = FALSE)
}
\arguments{
\item{year}{the year for which you want to retreive collisions data for}

\item{readpath}{the path where you saved the file with the api key, defaults to working directory}

\item{isFirewall}{specify if you are behind a corporate firewall that might cause issues. Defaults to FALSE}
}
\description{
This function returns a dataframe of collisions in London
This dataset contains car park names, state (giving an indication of whether it is open or closed), capacity and real-time occupancy for selected car parks in the districts of Manchester, Stockport and Wigan only.
Metrolink Park & Ride sites will be available shortly.
Function also exracts longitude and latitude into separate columns from WKT column
}
\examples{
collisions_df <- get_tfl_collisions("2015")
}
\keyword{api,}
\keyword{collisions}
\keyword{tfl,}
\keyword{transport,}
\keyword{uk,}

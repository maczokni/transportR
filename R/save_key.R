#' Save key Function
#'
#' This function allows you to save your api key to a .txt file, which you can read it from in the other functions.
#' @param org code of transport authority the key is for (tfl for Transport for London, tfgm for Transport for Greater Manchester)
#' @param app_key the API key for your application
#' @param app_id the API id for your application (TfL only)
#' @param writepath the path where you want to save the file, defaults to working directory
#' @keywords transport, api, uk
#' @export
#' @examples
#' save_key("tfl", "0f2fd687", "6c23ac1o45cfec9hhd6bf32b393a84do3") #these are not real api key/id values

save_key <- function(org, app_key, app_id = NULL, writepath = getwd()){

  if(tolower(org)=="tfl"){

    if(!is.null(app_id)){
      outFile <- paste0("app_id=", app_id, "&app_key=", app_key)
    } else{
      stop("You need an app id as well as the app key for tfl!")
    }

  } else if(tolower(org)=="tfgm") {

    outFile <- app_key

  } else {
    stop("The org you entered is not currently supported. Current options are : tfl, tfgm.")
  }

  write(outFile,
        file = paste0(writepath, "/", tolower(org), "key.txt"))
}



#' Checks and creates the GEM data directory path if needed
#' @description Creates a new directory for GEM data if there is no one to store GEM data
#' @export
check_path <- function(){

  user_path <- NULL

  if(is.null(getOption('gem.path'))){
    message("A path is required to hold your GEM files")
    user_path <- readline("Please enter the full path to download files into ( or hit ENTER to use default '~/GEMData'): ")
    user_path <- ifelse(grepl("",user_path),paste(Sys.getenv("HOME"),"GEMData",sep="/"),user_path)
    options(gem.path =  user_path)
  }

  if(is.null(user_path)){
    user_path <- getOption('gem.path')
  }

  print(user_path)

  ## Checks if data directory does not exist
  if(!file.exists(user_path)){

    ## Then creates it
    dir.create(user_path)

  }
}

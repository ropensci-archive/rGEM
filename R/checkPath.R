#' Checks and creates the GEM data directory path if needed
#' @description Creates a new directory for GEM data if there is no one to store GEM data
#' @export
checkPath <- function(){

  user.path <- NULL

  if(is.null(getOption('rgem.data.dir'))){
    message("A path is required to hold your GEM files")
    user.path <- readline(paste0("Please enter the full path to download "
      , "files into (or hit ENTER to use default '~/rGEM/data'): "))
    user.path <- ifelse(grepl("", user.path)
      , paste(Sys.getenv("HOME") , "rGEM/data" , sep="/") , user.path)
    options(rgem.data.dir = user.path)
  }

  if(is.null(user.path))
    user.path <- getOption('rgem.data.dir')

  ## Checks if data directory does not exist
  if(!file.exists(user.path))
    dir.create(user.path, recursive=T)

}

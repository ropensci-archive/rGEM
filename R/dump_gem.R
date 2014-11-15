#' Dumps all GEM data
#' @description Downloads all public GEM data from the GEM project website
#' @param keepZip if TRUE, leave the downloaded zip files in your 'gem.path',
#' if FALSE, they will be deleted, default FALSE
#' @param overwirte if TRUE, skips downloading already existing data files, if
#' FALSE, they will be downloaded again and owerwritten, default FALSE
#' @export
#' @examples
#' dump_gem()
dump_gem  <- function(keepZip=FALSE, overwrite=FALSE){

  # Checks the data directory 
  check_path()

  data("gem_list")

  # For all GEM public data
  for(cnt.data in gem.list$download.id){
    # Downloads the data
    gem.set <- get_gem_data(cnt.data, keepZip=keepZip, overwrite=overwrite)
  }

}


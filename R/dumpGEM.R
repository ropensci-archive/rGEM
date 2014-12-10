#' Dumps all GEM data
#' @description Downloads all public GEM data from the GEM project website
#' @param keep_zip if TRUE, leave the downloaded zip files in your 'gem.path',
#' if FALSE, they will be deleted, default FALSE
#' @param overwrite if TRUE, skips downloading already existing data files, if
#' FALSE, they will be downloaded again and overwritten, default FALSE
#' @export
#' @examples
#' \dontrun{
#' dumpGEM()
#' }
dumpGEM <- function(keep_zip = FALSE, overwrite = FALSE){

  # Checks the data directory
  checkPath()

  data("gem_list")

  # For all GEM public data
  for (cnt.data in gem.list$download.id) {
    # Downloads the data
    gem.set <- getGEMData(cnt.data, keep_zip=keep_zip, overwrite=overwrite)
  }

}

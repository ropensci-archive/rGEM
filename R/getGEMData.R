#' Downloads a set of GEM data and restores it in gem.path
#' @description Downloads a set of public GEM data from the GEM project website
#' @param gem_file_id if true, leave the downloaded zip files in your
#' 'rgem.data.dir', if FALSE, they will be deleted
#' @param overwirte if TRUE, skips downloading already existing data files, if
#' FALSE, they will be downloaded again and owerwritten, default FALSE
#' @param keep_zip if true, leave the downloaded zip files in your 'gem.path',
#' if FALSE, they will be deleted
#' @export
getGEMData <- function(gem_file_id, overwrite = FALSE, keep_zip = FALSE){

  gem.base.url <- "http://www.gemconsortium.org/docs/download/"

  checkPath()

  data("gem_list")

  gem.file <- sprintf("%s/%s", options("rgem.data.dir")
    , gem.list[gem.list$download.id==gem_file_id, ]$file)
  gem.zip.file <- sprintf("%s/%s.zip", options("rgem.data.dir"), gem_file_id)
  gem.zip.dir <- sprintf("%s/%s/", options("rgem.data.dir"), gem_file_id)
  gem.url <- paste0(gem.base.url, gem_file_id)

  # If owerrite = FALSE, skips the existing files
  if (!overwrite) {
    if (file.exists(gem.file)) {
      message(paste0("File ", gem.file, "exist and skipped "))
      return()
    }
  }

  # Downloads and unzips data
  download.file(gem.url, gem.zip.file, method="wget")
  unzip(gem.zip.file, exdir=gem.zip.dir)

  # Looks for a `.sav` or `.por` files
  sav <- list.files(gem.zip.dir, pattern="sav", recursive=T)
  por <- list.files(gem.zip.dir, pattern="POR", recursive=T)

  # Loads the file
  if (length(sav)) {
    gem <- read.spss(sprintf("%s/%s", gem.zip.dir, sav))
  } else if (length(por)) {
    gem <- spss.portable.file(sprintf("%s/%s", gem.zip.dir, por))
  }

  save(gem, file=gem.file)

  # Cleanings
  ## Frees memory
  rm(gem)
  ## Unlinks (~deletes) temp and zip files
  unlink(sprintf("%s/%s/", options("rgem.data.dir"), gem_file_id) , recursive=T)
  if (!keep_zip)
    unlink(sprintf("%s/%s.zip", options("rgem.data.dir"), gem_file_id), recursive=T)

}

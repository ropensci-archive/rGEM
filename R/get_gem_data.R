#' Downloads a set of GEM data and restores it in gem.path
#' @description Downloads a set of public GEM data from the GEM project website
#' @param gem.file.id if true, leave the downloaded zip files in your
#' 'gem.path', if FALSE, they will be deleted
#' @param overwirte if TRUE, skips downloading already existing data files, if
#' FALSE, they will be downloaded again and owerwritten, default FALSE
#' @param keepZip if true, leave the downloaded zip files in your 'gem.path',
#' if FALSE, they will be deleted

get_gem_data <- function(gem.file.id, overwrite=FALSE, keepZip=FALSE){

  gem.base.url <- "http://www.gemconsortium.org/docs/download/"

  check_path()

  data("gem_list")

  gem.file <- sprintf("%s/%s", options("rgem.data.dir")
                      , gem.list[gem.list$download.id==gem.file.id, ]$file)
  gem.zip.file <- sprintf("%s/%s.zip", options("rgem.data.dir"), gem.file.id)
  gem.zip.dir <- sprintf("%s/%s/", options("rgem.data.dir"), gem.file.id)
  gem.url <- paste0(gem.base.url, gem.file.id)

  # If owerrite = FALSE, skips the existing files
  if(!overwrite){
    if(file.exists(gem.file)){
      print(paste0("File ", gem.file, "exist and skipped "))
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
  if (length(sav)){
    gem <- read.spss(sprintf("%s/%s", gem.zip.dir, sav))
  } else if (length(por)){
    gem <- spss.portable.file(sprintf("%s/%s", gem.zip.dir, por))
  }

  save(gem, file=gem.file)

  # Cleanings
  ## Frees memory
  rm(gem)
  ## Unlinks (~deletes) temp and zip files
  unlink(sprintf("%s/%s/", options("rgem.data.dir"), gem.file.id) , recursive=T)
  if(!keepZip) 
    unlink(sprintf("%s/%s.zip", options("rgem.data.dir"), gem.file.id), recursive=T)

}

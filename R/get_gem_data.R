#' Downloads a set of GEM data and restores it in gem.path
#' @description Downloads a set of public GEM data from the GEM project website
#' @param gem.file.id if true, leave the downloaded zip files in your
#' 'gem.path', if FALSE, they will be deleted
#' @param skipExisting if true, skips files already downloaded, if FALSE, they
#' will be downloaded again and overwritten
#' @param keepZip if true, leave the downloaded zip files in your 'gem.path',
#' if FALSE, they will be deleted

get_gem_data <- function(gem.file.id, skipExisting=TRUE, keepZip=FALSE){

  check_path()

  load_config()

  load("data/gem_list.rda")

  # Downloads data
  download.file(
                paste0(gem.base.url, gem.file.id)
                , sprintf("%s/%s.zip", options("gem.path"), gem.file.id)
                , method="wget"
  )

  # Unzips data
  unzip(
                 sprintf("%s/%s.zip", options("gem.path"), gem.file.id)
                 , exdir=sprintf("%s/%s/", options("gem.path"), gem.file.id)
  )

  # Reads the dir name
  dir.name <- list.files(
                         sprintf("%s/%s/", options("gem.path"), gem.file.id)
  )

  # Extracts the year and set title
  year <- substring(dir.name, 5, 8)
  set <- tolower(substring(dir.name, 10, 12))

  # Extracts data level from directory file name
  level <- tolower(substring(dir.name, 14))
  level <- gsub(c("global "), "", level)

  # Dirtyfixes GEM data publication inconsistencies
  level <- gsub(c(" level data"), "", level)
  level <- gsub(c(" leveldata"), "", level)
  level <- gsub(c(" leveldata"), "", level)
  level <- gsub(c(".sav"), "", level)

  # Dirtyfixes GEM data publication inconsistencies
  if(gem.file.id == "388"){
    set <- "aps";
    file.rename(sprintf("%s/388/GEM 2000 Adult Pop Data.POR", options("gem.path")) 
                ,sprintf("%s/388/GEM 2000 Adult Pop Data.por", options("gem.path")))
    level <- ""
  }

  # Looks for `.sav` files
  sav <- list.files(
                    sprintf("%s/%s/", options("gem.path"), gem.file.id)
                    , pattern="sav", recursive=T
  )

  # Looks for `.por` files
  por <- list.files(
                    sprintf("%s/%s/", options("gem.path"), gem.file.id)
                    , pattern="por", recursive=T
  )

  # If it is a `.sav` file
  if (length(sav)){

    # Loads spss file
    gem <- read.spss(sprintf("%s/%s/%s", options("gem.path"), gem.file.id, sav))

  }

  # If it is a `.por` file
  if(length(por)){

    # Loads spss file
    gem <- spss.portable.file(sprintf("%s/%s/%s", options("gem.path"), gem.file.id, por))

  }

  # Saves the dataframe as `.rda`
  gem.file <- sprintf(
                      "%s/gem.%s.%s.%s.rda"
                      , options("gem.path")
                      , year
                      , set
                      , gsub(" ",".",tolower(level))
  )
  save(gem, file=gem.file)

  # Cleanings

  ## Frees memory
  rm (gem)

  ## Unlinks (~deletes) temp files
         print(sprintf("%s/%s/", options("gem.path"), gem.file.id))
  unlink(
         sprintf("%s/%s/", options("gem.path"), gem.file.id)
         , recursive=T
         )

  ## Unlinks (~deletes) temp files if not keepZip
  if(!keepZip){
    unlink(
           sprintf("%s/%s.zip", options("gem.path"), gem.file.id)
           , recursive=T
           )
  }

  # Returns an array
  return(
         c("Year"=year
           , "Set"=toupper(set)
           , "Level"=level
           , "File"=gsub(sprintf("%s/", options("gem.path")), "", gem.file)
           , "Id"=gem.file.id
           )
  )
}

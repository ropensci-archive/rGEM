# Loads configurations
#source("config.R")

get.gem.data <- function(cnt.data){
  # Downloads data
  download.file(
                paste0(gem.base.url, cnt.data)
                , sprintf("../data/%s.zip", cnt.data)
                , method="wget"
  )

  # Unzips data
  unzip <- unzip(
                 sprintf("../data/%s.zip", cnt.data)
                 , exdir=sprintf("../data/%s/", cnt.data)
  )

  # Jump empty files
  if(length(unzip)==0){
    next
  }

  # Reads the dir name
  dir.name <- list.files(
                         sprintf("../data/%s/", cnt.data)
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
  if(cnt.data == "388"){
    set <- "aps";
    file.rename("../data/388/GEM 2000 Adult Pop Data.POR"
                ,"../data/388/GEM 2000 Adult Pop Data.por")
    level <- ""
  }

  # Looks for `.sav` files
  sav <- list.files(
                    sprintf("../data/%s/", cnt.data)
                    , pattern="sav", recursive=T
  )

  # Looks for `.por` files
  por <- list.files(
                    sprintf("../data/%s/", cnt.data)
                    , pattern="por", recursive=T
  )

  # If it is a `.sav` file
  if (length(sav)){

    # Loads spss file
    gem <- read.spss(sprintf("../data/%s/%s", cnt.data, sav))

  }

  # If it is a `.por` file
  if(length(por)){

    # Loads spss file
    gem <- spss.portable.file(sprintf("../data/%s/%s", cnt.data, por))

  }

  # Saves the dataframe as `.rda`
  gem.file <- sprintf(
                      "../data/gem.%s.%s.%s.rda"
                      , year
                      , set
                      , gsub(" ",".",tolower(level))
  )
  save(gem, file=gem.file)

  # Cleanings

  ## Frees memory
  rm (gem)

  ## Unlinks (~deletes) temp files
  unlink(
         c(
           sprintf("../data/%s/", cnt.data)
           ,sprintf("../data/%s.zip", cnt.data)
           )
         , recursive=T
  )

  # Returns an array
  return(
         c("Year"=year
           , "Set"=toupper(set)
           , "Level"=level
           , "File"=gsub("../data/", "", gem.file)
           )
  )
}

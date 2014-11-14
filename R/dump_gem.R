#' Dumps all GEM data
#' @description Downloads all public GEM data from the GEM project website
#' @param keepZip if true, leave the downloaded zip files in your 'gem.path', if FALSE, they will be deleted, default FALSE
#' @export
#' @examples
#' dump_gem()
dump_gem  <- function(keepZip = FALSE){

  # Checks the data directory 
  check_path()

  # Loads configuration 
  load_config()

  load("../data/gem_list.rda")

  print(gem.list)

  # A list to Keep the list of imported datasets
  dump.list <- list()

  # For all GEM public data
  for(cnt.data in gem.list$download.id){

    # Downloads the data
    gem.set <- get_gem_data(cnt.data, keepZip=keepZip)

    # Keeps the data info in a list
    dump.list <- rbind(dump.list, gem.set, )

  }

  # Puts the dump.list in order
  dump.list <- dump.list[ order(dump.list[,4]), ]

  # Saves the dump.list
  save(dump.list, file="../data/dump_list.rda")

  # Returns the results
  return(dump.list)

}


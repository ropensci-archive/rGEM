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

  # A list to Keep the list of imported datasets
  gem.list <- list()

  print(gem.urls)

  # For all GEM public data
  for(cnt.data in gem.urls){

  print(cnt.data)

    # Downloads the data
    tmp.verbose <- get_gem_data(cnt.data, keepZip=keepZip)

    # Keeps the data info in a list
    gem.list <- rbind(gem.list, tmp.verbose)

  }

  # Puts the gem.list in order
  gem.list <- gem.list[ order(gem.list[,4]), ]

  # Returns the results
  return(gem.list)

}


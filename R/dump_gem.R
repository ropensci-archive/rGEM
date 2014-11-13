dump_gem  <- function(){

  # A list to Keep the list of imported datasets
  gem.list <- list()

  # For all GEM public data
  for(cnt.data in gem.urls){

    # Downloads the data
    tmp.verbose <- get.gem.data(cnt.data)

    # Keeps the data info in a list
    gem.list <- rbind(gem.list, tmp.verbose)

  }

  # Puts the gem.list in order
  gem.list <- gem.list[ order(gem.list[,4]), ]

  return(gem.list)

}


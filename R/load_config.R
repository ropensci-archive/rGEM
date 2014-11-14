#' Loads the configurations
#' @export
load_config <- function(){
}
  # base URL to GEM data download
  gem.base.url <- "http://www.gemconsortium.org/docs/download/"

  # List of GEM public data
  # Extracted manually from www.gemconsortium.org
  # date: 13/11/2014
  #gem.public.data <- c(
  #                     "1999", "NES", "national"  , "383"
  #                   , "1999", "APS", "individual", "386"
  #                   , "2000", "NES", "national"  , "387"
  #                   , "2000", "APS", ""          , "388"
  #                   , "2001", "NES", "national"  , "389"
  #                   , "2002", "NES", "national"  , "391"
  #                   , "2003", "NES", "national"  , "394"
  #                   , "2003", "APS", "national"  , "396"
  #                   , "2004", "NES", "national"  , "397"
  #                   , "2004", "APS", "national"  , "399"
  #                   , "2005", "NES", "national"  , "400"
  #                   , "2005", "APS", "national"  , "402"
  #                   , "2006", "NES", "national"  , "403"
  #                   , "2006", "APS", "national"  , "405"
  #                   , "2007", "NES", "national"  , "410"
  #                   , "2007", "APS", "national"  , "411"
  #                   , "2009", "APS", "national"  , "2642"
  #                   , "2009", "NES", "national"  , "2644"
  #                   , "1999", "NES", "individual", "3091"
  #                   , "2001", "NES", "individual", "3092"
  #                   , "2002", "NES", "individual", "3093"
  #                   , "2005", "NES", "individual", "3094"
  #                   , "2007", "NES", "individual", "3095"
  #                   , "2008", "NES", "individual", "3096"
  #                   , "2009", "NES", "individual", "3097"
  #                   , "2001", "APS", "individual", "3122"
  #                   , "2002", "APS", "individual", "3123"
  #                   , "2003", "APS", "individual", "3124"
  #                   , "2004", "APS", "individual", "3125"
  #                   , "2005", "APS", "individual", "3126"
  #                   , "2006", "APS", "individual", "3127"
  #                   , "2007", "APS", "individual", "3128"
  #                   , "2008", "APS", "individual", "3129"
  #                   , "2009", "APS", "individual", "3130"
  #                   , "2010", "APS", "individual", "3132"
  #                   , "2010", "APS", "national"  , "3133"
  #                   , "2010", "NES", "national"  , "3134"
  #                   , "2010", "NES", "individual", "3135"
  #                   )

  #gem.list <- matrix(gem.public.data, ncol=4, byrow=T)
  #gem.list <- gem.list[ order(gem.list[,1], gem.list[,2], gem.list[,3]), ]
  #gem.list <- data.frame(gem.list)
  #names(gem.list) <- c("year", "set", "level", "id")
  #save(gem.list, file="../data/gem_list.rda")

  # If you have access to other GEM data override here

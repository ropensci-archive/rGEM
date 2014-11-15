#' Loads the configurations
#' @export
load_config <- function(){
}
  # base URL to GEM data download

  # List of GEM public data
  # Extracted manually from www.gemconsortium.org
  # date: 13/11/2014
  #gem.public.data <- c(
  #                     "1999", "NES", "national"  , "383",  "sav", "gem.1999.nes.national.rda"
  #                   , "1999", "APS", "individual", "386",  "sav", "gem.1999.aps.individual.rda"
  #                   , "2000", "NES", "national"  , "387",  "sav", "gem.2000.nes.national.rda"
  #                   , "2000", "APS", "national"  , "388",  "por", "gem.2000.aps.national.rda"
  #                   , "2001", "NES", "national"  , "389",  "sav", "gem.2001.nes.national.rda"
  #                   , "2002", "NES", "national"  , "391",  "sav", "gem.2002.nes.national.rda"
  #                   , "2003", "NES", "national"  , "394",  "sav", "gem.2003.nes.national.rda"
  #                   , "2003", "APS", "national"  , "396",  "sav", "gem.2003.aps.national.rda"
  #                   , "2004", "NES", "national"  , "397",  "sav", "gem.2004.nes.national.rda"
  #                   , "2004", "APS", "national"  , "399",  "sav", "gem.2004.aps.national.rda"
  #                   , "2005", "NES", "national"  , "400",  "sav", "gem.2005.nes.national.rda"
  #                   , "2005", "APS", "national"  , "402",  "sav", "gem.2005.aps.national.rda"
  #                   , "2006", "NES", "national"  , "403",  "sav", "gem.2006.nes.national.rda"
  #                   , "2006", "APS", "national"  , "405",  "sav", "gem.2006.aps.national.rda"
  #                   , "2007", "NES", "national"  , "410",  "sav", "gem.2007.nes.national.rda"
  #                   , "2007", "APS", "national"  , "411",  "sav", "gem.2007.aps.national.rda"
  #                   , "2009", "APS", "national"  , "2642", "sav", "gem.2009.aps.national.rda"
  #                   , "2009", "NES", "national"  , "2644", "sav", "gem.2009.nes.national.rda"
  #                   , "1999", "NES", "individual", "3091", "sav", "gem.1999.nes.individual.rda"
  #                   , "2001", "NES", "individual", "3092", "sav", "gem.2001.nes.individual.rda"
  #                   , "2002", "NES", "individual", "3093", "sav", "gem.2002.nes.individual.rda"
  #                   , "2005", "NES", "individual", "3094", "sav", "gem.2005.nes.individual.rda"
  #                   , "2007", "NES", "individual", "3095", "sav", "gem.2007.nes.individual.rda"
  #                   , "2008", "NES", "individual", "3096", "sav", "gem.2008.nes.individual.rda"
  #                   , "2009", "NES", "individual", "3097", "sav", "gem.2009.nes.individual.rda"
  #                   , "2001", "APS", "individual", "3122", "sav", "gem.2001.aps.individual.rda"
  #                   , "2002", "APS", "individual", "3123", "sav", "gem.2002.aps.individual.rda"
  #                   , "2003", "APS", "individual", "3124", "sav", "gem.2003.aps.individual.rda"
  #                   , "2004", "APS", "individual", "3125", "sav", "gem.2004.aps.individual.rda"
  #                   , "2005", "APS", "individual", "3126", "sav", "gem.2005.aps.individual.rda"
  #                   , "2006", "APS", "individual", "3127", "sav", "gem.2006.aps.individual.rda"
  #                   , "2007", "APS", "individual", "3128", "sav", "gem.2007.aps.individual.rda"
  #                   , "2008", "APS", "individual", "3129", "sav", "gem.2008.aps.individual.rda"
  #                   , "2009", "APS", "individual", "3130", "sav", "gem.2009.aps.individual.rda"
  #                   , "2010", "APS", "individual", "3132", "sav", "gem.2010.aps.individual.rda"
  #                   , "2010", "APS", "national"  , "3133", "sav", "gem.2010.aps.national.rda"
  #                   , "2010", "NES", "national"  , "3134", "sav", "gem.2010.nes.national.rda"
  #                   , "2010", "NES", "individual", "3135", "sav", "gem.2010.nes.individual.rda"
  #                   )

  #gem.list <- matrix(gem.public.data, ncol=6, byrow=T)
  #gem.list <- gem.list[ order(gem.list[,1], gem.list[,2], gem.list[,3]), ]
  #gem.list <- data.frame(gem.list)
  #names(gem.list) <- c("year", "set", "level", "download.id", "type", "file")
  #save(gem.list, file="data/gem_list.rda")

  # If you have access to other GEM data override here

#' Loads the configurations
#' @export
load_config <- function(){
}
  # base URL to GEM data download
  gem.base.url <- "http://www.gemconsortium.org/docs/download/"

  # List of GEM public data
  # Extracted manually from www.gemconsortium.org
  # date: 13/11/2014
  gem.public.urls <- c(
                       383
                       ,386:389
                       ,391
                       ,394:394
                       ,396:397
                       ,399:400
                       ,402:403
                       ,405
                       ,410:411
                       ,2642
                       ,2644
                       ,3091:3097
                       ,3122:3130
                       ,3132:3135
                       )

  # If you have access to other urls override here
  gem.urls <- gem.public.urls

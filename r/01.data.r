# This file is a wrapper for `xx.01.data.rmd` to generate 
# a proper pdf file in `/report` directory

library(rmarkdown)

rmarkdown::render(
  "xx.01.data.rmd"
  , output_file= "../report/01.data.pdf"
); 


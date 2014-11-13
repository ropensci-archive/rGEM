report_gem_data <- function(){
  rmarkdown::render(
                    "../report/data.Rmd"
                    , output_file= "../report/data.pdf"
                    ); 
}


##' @import data.table pipeR rlist openxlsx ggplot2 ReporteRs
##' @importFrom dplyr mutate select arrange
##' @importFrom stringr str_trim
NULL

.onLoad <- function(libname = find.package('doctemplates'),
                    pkgname = 'doctemplates'){

  dir.root <- '/Users/jankocizel/Documents/Dropbox/Projects/PhD Thesis/R/PACKAGES/doctemplates/'

  options(width = 80)

  options("ReporteRs-default-font" = "Times New Roman")
  options("ReporteRs-locale.language"="en")
  options("ReporteRs-locale.region"="US")
  options("ReporteRs-backtick-color" = "#c7254e" )
  options("ReporteRs-backtick-shading-color" = "#f9f2f4" )
  options("ReporteRs-fontsize"=10L)

  message(rep("*",70))
  message("doctemplates")
  message("By Cizel et al, 2016. All rights reserved.")
  message("www.jankocizel.com")
  message(rep("*",70))
}

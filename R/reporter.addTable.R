##' @export
reporter.addTable <- function(doc,flextable,title,landscape = FALSE){
  if (landscape == TRUE){
    doc %>>%
      addSection(landscape = TRUE) ->
      doc
  }

  doc %>>%
    addParagraph(
      title,
      stylename = quicktable[['stylename']]
    ) %>>%
    addFlexTable(
      flextable
    ) %>>%
    addParagraph(
      ""
    ) ->
    doc

  return(doc)
}

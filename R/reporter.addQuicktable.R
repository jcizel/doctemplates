##' @export
reporter.addQuicktable <- function(doc,quicktable){
  if (quicktable[['landscape']] == TRUE){
    doc %>>%
      addSection(landscape = TRUE) ->
      doc
  }

  doc %>>%
    addParagraph(
      quicktable[['title']],
      stylename = quicktable[['stylename']]
    ) %>>%
    addFlexTable(
      quicktable[['table']]
    ) %>>%
    addParagraph(
      ""
    ) ->
    doc

  return(doc)
}

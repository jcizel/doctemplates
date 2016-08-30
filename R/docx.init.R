##' @import ReporteRs
##' @export
docx.init <- function(title,
                      author,
                      type = c('report','simpledoc')){

  file.template = system.file('templates/IMF Working Paper Template.docx',
                              package = 'doctemplates')

  doc = docx(template = file.template)

  if (type[[1L]] == 'report'){
    doc %>>%
      addParagraph(
        bookmark = "TITLE",
        value = title,
        style = 'DocumentTitle'
      ) %>>%
      addParagraph(
        bookmark = "AUTHOR",
        value = author,
        style = 'DocumentAuthor'
      ) %>>%
      addParagraph(
        bookmark = 'DATE',
        value = Sys.time() %>>% as.character,
        style = 'DocumentDate'
      ) %>>%
      addParagraph('',stylename = 'Normal', par.properties = parCenter()) %>>%
      addParagraph(
        "Table of Contents",
        stylename = 'Normal', par.properties = parCenter()
      ) %>>%
      addTOC %>>%
      addParagraph(
        "List of Tables",
        stylename = 'Normal', par.properties = parCenter()
      ) %>>%
      addTOC(
        stylename = 'tablecaption'
      ) %>>%
      addParagraph(
        "List of Figures",
        stylename = 'Normal', par.properties = parCenter()
      ) %>>%
      addTOC(
        stylename = 'figurecaption'
      ) %>>%
      addPageBreak ->
      doc
  } else if (type[[1L]] == 'simpledoc'){
    doc %>>%
      addParagraph(
        bookmark = "TITLE",
        value = title,
        style = 'DocumentTitle'
      ) %>>%
      addParagraph(
        bookmark = "AUTHOR",
        value = author,
        style = 'DocumentAuthor'
      ) %>>%
      addParagraph(
        bookmark = 'DATE',
        value = Sys.time() %>>% as.character,
        style = 'DocumentDate'
      ) %>>%
      addParagraph('',stylename = 'Normal', par.properties = parCenter()) ->
      doc
  } else {
    stop("type can be either 'report' or 'simpledoc'")
  }

  return(doc)
}

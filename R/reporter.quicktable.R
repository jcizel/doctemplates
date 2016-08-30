##' @export
reporter.quicktable <-
  function(
           tabletype = c('table','figure'),
           title = 'Generic Table',
           footnote = 'Footnote.',
           landscape = FALSE,
           ncol = 2,
           nrow = 4,
           font.size = 10,
           font.family = 'Times New Roman',
           inner.vertical = 1,
           inner.horizontal = 1,
           outer.vertical = 1,
           outer.horizontal = 1,
           table.width = ifelse(landscape == TRUE, 9, 6.6),
           column.width = table.width / ncol,
           widths = rep(column.width,times = ncol)
           ){
    stylename = ifelse(tabletype[[1L]] == 'figure', 'figurecaption', 'tablecaption')

    matrix('x',nrow = nrow,ncol=ncol) %>>%
      data.frame %>>%
      FlexTable(
        header.columns = FALSE,
        body.text.props =
          textProperties(font.size = font.size,
                         font.family = font.family),
        body.par.props = parProperties(text.align = 'justify',padding = 0)
      ) %>>%
      addFooterRow(
        value = footnote,
        colspan = ncol,
        text.properties = textNormal()
      ) %>>%
      setFlexTableBorders(
        footer = TRUE,
        inner.vertical = borderProperties(width = inner.vertical),
        outer.vertical = borderProperties(width = outer.vertical),
        inner.horizontal = borderProperties(width = inner.horizontal),
        outer.horizontal = borderProperties(width = outer.horizontal)
      ) %>>%
      setFlexTableWidths(
        widths = widths
      ) ->
      TABLE

    result =
      list(
        table = TABLE,
        title = title,
        stylename = stylename,
        landscape = landscape
      )

    return(result)
  }

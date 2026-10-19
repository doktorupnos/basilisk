#import "@preview/itemize:0.2.0" as el
#import "../util/options.typ": opt

/// Applies the show rules of bullet and
/// enumerated lists.
///
/// - doc (content): The document body.
/// -> content
#let rules-list(doc) = {
  show: el.default-enum-list
  set enum(
    tight: opt.list.tight,
    body-indent: opt.list.body-indent,
    spacing: opt.list.spacing
  )
  set list(
    tight: opt.list.tight,
    body-indent: opt.list.body-indent,
    spacing: opt.list.spacing
  )
  doc
}

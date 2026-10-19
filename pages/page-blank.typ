/// Creates a blank page that contains no header or footer.
///
/// - doc (content): The document body.
/// -> content
#let page-blank(doc) = {
  set page(
    paper: "a4",
    margin: 2.5cm,
    header: none,
    footer: none
  )
  doc
}

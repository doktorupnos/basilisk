#import "../util/options.typ": opt

/// Cover's field text. Bold with level-1 heading scale for title and semibold
/// with level-2 heading scale for author's name.
///
/// - scale-level (int): The index of the field's scaling level.
/// -> content
#let cover-field(scale-level) = {
  let size = opt.text.size
  let scale = opt.heading.scale.at(scale-level)
  text(
    tracking: (
      if scale-level == 0 { 4pt }
      else { 2pt }
    ),
    weight: (
      if scale-level == 0 { "bold" }
      else { "semibold" }
    ),
    size: size * scale,
    upper(
      if scale-level == 0 { opt.document.title }
      else { opt.document.author }
    )
  )
}

/// Applies the show rules for the cover page layout. It contains the
/// title of the document set in the options file, along with the author's
/// name below it.
///
/// - doc (content): The document body.
/// -> content
#let page-cover(doc) = {
  set page(
    paper: "a4",
    margin: 2.5cm,
    header: none,
    footer: none
  )
  align(
    center + horizon,
    {
      cover-field(0)
      v(2em)
      cover-field(1)
    }
  )
  doc
}

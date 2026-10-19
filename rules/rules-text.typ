#import "../util/options.typ": opt

/// Applies the show rules for the main body
/// text and paragraphs.
///
/// - doc (content): The document body.
/// -> content
#let rules-text(doc) = {
  set text(
    font: opt.text.font,
    size: opt.text.size,
    lang: opt.text.lang,
    overhang: false,
    top-edge: "ascender",
    bottom-edge: "descender",
    hyphenate: true
  )
  set par(
    leading: 0.6em,
    spacing: 1em,
    justify: true,
  )
  set v(weak: true)
  doc
}

#import "../util/options.typ": opt

/// Applies the show rules for inline code and
/// code blocks.
///
/// - doc (content): The document body.
/// -> content
#let rules-code(doc) = {
  show raw: set text(font: opt.code.font)
  show raw.where(block: true): it => {
    block(
      width: 100%,
      stroke: {
        if opt.code.style {luma(200)}
        else {none}
      },
      fill: {
        if opt.code.style {luma(250)}
        else {none}
      },
      inset: {
        if opt.code.style {1em}
        else {0em}
      },
      it
    )
  }
  doc
}

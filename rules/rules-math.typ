#import "../util/options.typ": opt

/// Applies the show rules of math equations.
///
/// - doc (content): The document body.
/// -> content
#let rules-math(doc) = {
  show math.equation: it => {
    set text(
      font: opt.text.math,
      top-edge: "bounds",
      bottom-edge: "bounds",
    )
    set block(breakable: true)
    it
  }
  show math.equation.where(
    block: true
  ): it => {
    v(2em)
    it
    v(2em)
  }
  doc
}

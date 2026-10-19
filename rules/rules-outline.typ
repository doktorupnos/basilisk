#import "../util/options.typ": opt
#import "../util/counters.typ": (
  counter-outline1,
  counter-outline2
)

/// Level 1 outline prefix.
/// -> content
#let prefix-outline1() = {
  let pattern = opt.heading.pattern.at(0)
  if pattern.len() != 0 {
    let label = opt.heading.label
    if label.len() != 0 {
      strong(label)
      sym.space
    }
    strong(
      context numbering(
        pattern,
        counter-outline1.get().first()
      )
    )
  }
}

/// Level 2 outline prefix.
/// -> content
#let prefix-outline2() = {
  let pattern = opt.heading.pattern.at(1)
  if pattern.len() != 0 {
    context strong(
      numbering(
        pattern,
        counter-outline1.get().first(),
        counter-outline2.get().first()
      )
    )
  }
}

/// Applies the outline show rules.
///
/// - doc (content): The document body.
/// -> content
#let rules-outline(doc) = {
  let title = opt.outline.title
  set outline(title: title)
  // General rules.
  show outline: it => {
    pagebreak(to: "odd")
    set heading(bookmarked: true)
    show linebreak: none
    show heading: align(
      opt.outline.align,
      {
        text(tracking: 2pt, title)
        v(2em)
      }
    )
    it
  }
  show outline.entry.where(level: 1): it => {
    counter-outline1.step()
    v(2em)
    link(
      it.element.location(),
      it.indented(
        gap: 2em,
        prefix-outline1(),
        strong(it.inner())
      )
    )
  }
  show outline.entry.where(level: 2): it => {
    counter-outline2.step()
    v(1em)
    link(
      it.element.location(),
      it.indented(
        gap: 1em,
        prefix-outline2(),
        it.inner()
      )
    )
  }
  doc
}

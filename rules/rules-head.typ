#import "../util/options.typ": opt
#import "../util/counters.typ": (
  counter-head1,
  counter-head2,
  counter-head3,
  counter-header
)

/// Adds an invisible heading so the title appears in
/// the document outline and PDF bookmarks.
///
/// - level (int): The heading's level.
/// - title (content): The heading's title.
/// -> content
#let bookmark(level, title) = {
  show heading: none
  show linebreak: none
  heading(
    level: level,
    outlined: true,
    bookmarked: true,
    title
  )
}

/// Calculates the size of the heading depending on it's
/// depth level.
///
/// - level (int): The heading's depth level.
/// -> length
#let heading-size(level) = {
  let size = opt.text.size
  let scale = opt.heading.scale.at(level - 1)
  size * scale
}

/// Level 1 heading prefix.
/// -> content
#let prefix-head1() = {
  let pattern = opt.heading.pattern.at(0)
  if pattern.len() != 0 {
    let label = opt.heading.label
    if label.len() != 0 {
      label
      sym.space
    }
    counter-head1.display(pattern)
    if opt.heading.academic { v(1em) } else { h(0.8em) }
  }
}

/// Level 2 heading prefix.
/// -> content
#let prefix-head2() = {
  let pattern = opt.heading.pattern.at(1)
  if pattern.len() != 0 {
    context numbering(
      pattern,
      counter-head1.get().first(),
      counter-head2.get().first()
    )
    h(0.8em)
  }
}

/// Level 3 heading prefix.
/// -> content
#let prefix-head3() = {
  let pattern = opt.heading.pattern.at(2)
  if pattern.len() != 0 {
    strong(
      context numbering(
        pattern,
        counter-head1.get().first(),
        counter-head2.get().first(),
        counter-head3.get().first()
      )
    )
    h(0.8em)
  }
}

/// Academic style variation for level 1 headings.
///
/// - title (content): The title of the heading.
/// -> content
#let style-academic(title) = {
  set text(tracking: 1pt)
  counter-header.update(0)
  pagebreak(to: "odd")
  counter-header.step()
  v(6em, weak: false)
  bookmark(1, title)
  prefix-head1()
  title
  v(6em)
}

/// Normal style variation for level 1 headings.
///
/// - title (content): the title of the heading.
/// -> content
#let style-normal(title) = {
  v(2em)
  bookmark(1, title)
  prefix-head1()
  title
  v(1em)
}

/// Applies the show rules of all heading levels.
///
/// Level 1 headings check for the `opt.heading.academic`
/// value option to determine their style variation.
///
/// - doc (content): The document body.
/// -> content
#let rules-head(doc) = {
  set heading(
    outlined: false,
    bookmarked: false,
  )
  show heading.where(level: 1): it => {
    set text(size: heading-size(1))
    counter-head1.step()
    counter-head2.update(0)
    counter-head3.update(0)
    align(
      opt.heading.align,
      if opt.heading.academic { style-academic(it.body) }
      else { style-normal(it.body) }
    )
  }
  show heading.where(level: 2): it => {
    set text(size: heading-size(2))
    show linebreak: none
    counter-head2.step()
    counter-head3.update(0)
    v(2em)
    bookmark(2, it.body)
    prefix-head2()
    it.body
    v(1em)
  }
  show heading.where(level: 3): it => {
    set text(size: heading-size(3))
    counter-head3.step()
    v(2em)
    head-3-prefix()
    it.body
    v(1em)
  }
  doc
}

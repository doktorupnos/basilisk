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
#let head-size(level) = {
  let size = opt.text.size
  let scale = opt.heading.scale.at(level - 1)
  size * scale
}

/// Creates the numbering prefix label of a heading based on
/// it's pattern. It passes the counter of the current level,
/// along with all levels above it.
///
/// - level (int): The heading's depth level.
/// - pattern (string): The heading's numbering pattern.
/// -> content
#let head-number(level, pattern) = {
  let counters = (
    counter-head1,
    counter-head2,
    counter-head3
  )
  context numbering(
    pattern,
    ..counters.slice(0, level).map(c => c.get().first())
  )
}

/// Creates the heading prefix based on the heading's
/// depth level. If no pattern is given in the options file,
/// it shows nothing.
///
/// - level (int): The heading's depth level.
/// -> content
#let head-prefix(level) = {
  let pattern = opt.heading.pattern.at(level - 1)
  if pattern.len() != 0 {
    let number = head-number(level, pattern)
    if level == 1 {
      let label = opt.heading.label
      if label.len() != 0 {
        label
        sym.space
      }
      number
      if opt.heading.academic { v(1em) } else { h(0.8em) }
    } else {
      number
      h(0.6em)
    }
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
  head-prefix(1)
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
  head-prefix(1)
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
    set text(size: head-size(1))
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
    set text(size: head-size(2))
    show linebreak: none
    counter-head2.step()
    counter-head3.update(0)
    v(2em)
    bookmark(2, it.body)
    head-prefix(2)
    it.body
    v(1em)
  }
  show heading.where(level: 3): it => {
    set text(size: head-size(3))
    counter-head3.step()
    v(2em)
    head-prefix(3)
    it.body
    v(1em)
  }
  doc
}

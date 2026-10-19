#import "../util/options.typ": opt
#import "../util/counters.typ": counter-divider

/// Builds the frame that contains the title of the
/// divider page.
///
/// - title (content): The title of the divider.
/// -> content
#let divider-title(title) = {
  show linebreak: v(1em)
  show text: it => align(right, it)
  box(
    width: 100%,
    height: 100%,
    inset: (
      top: 14em,
      right: 2em,
      bottom: 0em,
      left: 0em
    ),
    {
      let size = opt.text.size
      let scale = opt.heading.scale.at(0)
      text(
        weight: "bold",
        size: size * scale,
        tracking: 4pt,
        title
      )
    },
  )
}

/// Builds the black side frame that contains the divider
/// label and number.
/// -> content
#let divider-index() = {
  let size = opt.text.size
  let scale = opt.heading.scale.at(0)
  let label = opt.divider.label
  let label_exists = label.len() == 0
  show text: it => align(center, it)
  counter-divider.step()
  box(
    width: auto,
    height: 100%,
    fill: black,
    inset: (
      top: 14em,
      right: (
        if label_exists {3em}
        else {2em}
      ),
      bottom: 0em,
      left: (
        if label_exists {3em}
        else {2em}
      )
    ),
    {
      if not label_exists {
        text(
          weight: "bold",
          size: size * scale,
          fill: white,
          tracking: 4pt,
          label
        )
        v(2em)
      }
      text(
        weight: "bold",
        size: size * scale * 2,
        fill: white,
        tracking: 4pt,
        context numbering(
          opt.divider.pattern,
          counter-divider.get().first(),
        ),
      )
    },
  )
}

/// Applies the divider page layout and inserts it into
/// the document.
///
/// - doc (content): The document body.
/// - title (content): The title of the divider page.
/// -> content
#let page-divider(
  doc,
  title: [],
) = {
  set page(
    paper: "a4",
    margin: (
      top: 0cm,
      right: 2.5cm,
      bottom: 0cm,
      left: 0cm,
    ),
    header: none,
    footer: none,
  )
  pagebreak(to: "odd")
  grid(
    columns: (1fr, auto),
    gutter: 0pt,
    divider-title(title), divider-index(),
  )
  doc
}

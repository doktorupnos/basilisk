#import "../util/options.typ": opt
#import "../util/counters.typ": counter-header

/// Builds the header content that contains the current page number,
/// along with an optional title on the left page and an optional
/// subtitle on the right page.
///
/// - title (content): Usually the title of the document.
/// - subtitle (content): Usually the title of the chapter.
/// -> content
#let numbered-header(
  title,
  subtitle
) = {
  show linebreak: none
  show text: it => {
    set text(
      weight: "bold",
      size: 10pt
    )
    it
  }
  let even-page = calc.even(counter(page).get().first())
  context if even-page {
    counter(page).display()
    h(1fr)
    title
  } else {
    subtitle
    h(1fr)
    counter(page).display()
  }
  v(0.6em)
  line(length: 100%)
}

/// Applies the numbered page layout.
///
/// - doc (content): The document body.
/// - title (): Usually the title of the document.
/// - subtitle (): Usually the title of the current chapter.
/// -> content
#let page-numbered(
  doc,
  title: "",
  subtitle: ""
) = {
  set page(
    paper: "a4",
    margin: 2.5cm,
    header: context {
      let show_header = (
        opt.heading.academic
        and counter-header.get().first() == 1
      )
      if show_header { numbered-header(title, subtitle) }
      else { none }
    },
    footer: none
  )
  doc
}

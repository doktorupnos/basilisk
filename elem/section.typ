#import "../util/options.typ": opt

/// Creates a horizontal block divider that
/// contains a custom title inside it.
///
/// - title (content): The title of the horizontal divider.
/// -> content
#let section(title) = {
  box(
    width: 100%,
    height: auto,
    fill: black,
    inset: 0.6em,
    {
      let size = opt.text.size
      let scale = opt.heading.scale.at(1)
      set align(center)
      text(
        weight: "bold",
        size: size * scale,
        fill: white,
        tracking: 2pt,
        title
      )
    }
  )
  v(2em)
}

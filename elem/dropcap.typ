#import "@preview/droplet:0.3.1": dropcap as droplet-dropcap

/// Wraps `droplet`'s dropcap with some default style
/// options (two lines height and 4pt gap).
///
/// - text (content): The text whose first letter becomes a dropcap.
/// -> content
#let dropcap(text) = {
  droplet-dropcap(
    height: 2,
    gap: 4pt,
    overhang: 0pt,
    text
  )
}

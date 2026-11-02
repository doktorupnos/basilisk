#import "@preview/droplet:0.3.1" as droplet
#import "../util/options.typ": opt

/// Wraps `droplet`'s dropcap with some default style
/// options (two lines height and 4pt gap).
///
/// - body (content): The text whose first letter becomes a dropcap.
/// -> content
#let dropcap(body) = {
  droplet.dropcap(
    height: opt.dropcap.height,
    gap: opt.dropcap.gap,
    font: opt.dropcap.font,
    body
  )
}

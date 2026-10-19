// Show rules
#import "./rules/rules-text.typ": rules-text
#import "./rules/rules-head.typ": rules-head
#import "./rules/rules-outline.typ": rules-outline
#import "./rules/rules-list.typ": rules-list
#import "./rules/rules-code.typ": rules-code
#import "./rules/rules-math.typ": rules-math

// Elements
#import "./elem/Dropcap.typ": dropcap
#import "./elem/Section.typ": section

// Pages
#import "./pages/page-cover.typ": page-cover
#import "./pages/page-numbered.typ": page-numbered
#import "./pages/page-divider.typ": page-divider
#import "./pages/page-blank.typ": page-blank

/// Library's main export. Applies all major show
/// rules found in the `rules` directory. And imports
/// all custom elements found in the `elem` directory.
///
/// - doc (content): The document body.
/// -> content
#let basilisk(doc) = {
  show: rules-text
  show: rules-head
  show: rules-outline
  show: rules-math
  show: rules-code
  show: rules-list
  doc
}

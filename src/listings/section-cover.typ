#let sectionCover(title: none, imgUrl: none, imgCaption: none) = {
  show heading: set heading(numbering: none)

  set align(horizon + center)
  if imgUrl != none {
    if imgCaption != none {
      figure(
        image(imgUrl),
        caption: imgCaption,
      )
    }
  }

  set align(bottom + left)
  underline(
    stroke: (paint: black, thickness: 1.5pt),
    offset: 7pt,
  )[#upper()[= #title]]

  v(0.5cm)
  pagebreak()
}

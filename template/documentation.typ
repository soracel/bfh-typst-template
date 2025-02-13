#import "../src/skeletons/main-cover.typ": MainCover
#import "../src/skeletons/managment-summary.typ": ManagmentSummery
#import "../src/listings/table-of-contents.typ": TableOfContents
#import "../src/listings/table-of-figures.typ": TableOfFigures
#import "../src/listings/table-of-tables.typ": TableOfTables
#import "../src/listings/glossary.typ": Glossary
#import "../src/listings/list-of-abbreviations.typ": ListOfAbbreviations
#import "../src/skeletons/declaration-of-independence.typ": DeclarationOfIndependence

// Documentation settings
#let text-font = ("Lucida Sans", "Georgia")
#let text-size = 9.5pt
#let heading1-size = 14pt
#let heading2-size = text-size
#let heading3-size = text-size
#let heading4-size = text-size
#let footer-size = 8pt

#let bfh-yellow= rgb("#fac300")
#let bfh-gray = rgb("#697d91")
#let background = white

// Page settings
#let paper-size = "a4"
#let margin-top = 2.5cm
#let margin-bottom = 2cm

#let documentation(
  doc,
  coverImage: none,
  title: none,
  subtitle: none,
  typeOfWork: none,
  type: none,
  courseOfStudy: none,
  author: none,
  supervisor: none,
  client: none,
  expert: none,
  departement: none,
  version: none,
  managmentSummery: none,
  abbreviations: none,
  glossary: none,
  datePlaceImage: none,
  signatureImage: none,
  bibliography: none,
  appendice: none,
) = {
  // --- Document configurations ---

  // Set lang to German so that some strings (e.g. Abbildung) are automatically translated
  set text(lang: "de", hyphenate: true, font: text-font, size: text-size)

  set page(
    paper: paper-size,
    number-align: bottom + right, // Display page-number in bottom right
    margin: (top: margin-top, bottom: margin-bottom),
  )

  set page(
    footer: context {
      if counter(page).get().first() > 1 [
        #set text(footer-size)
        #author, #version, #datetime.today().display("[day].[month].[year]") #h(1fr) #counter(page).display("1")
      ]
    },
  )

  // Set spacing between paragraphs. Default is 1.2em
  set par(spacing: 1.7em)

  // If reference (#ref() / @)
  // does not have an element (an element referring to (e.g. heading)): display as is
  // is a heading: use heading as title and link to it
  // is not a heading: display as is
  show ref: it => if it.element != none {
    if it.element.func() == heading {
      let label = it.target // label
      let heading = it.element // heading
      link(label, [#heading.body])
    } else {
      it
    }
  } else {
    it
  }

  // --- Titelblatt ---
  show: MainCover.with(
    coverImage: coverImage,
    title: title,
    subtitle: subtitle,
    typeOfWork: typeOfWork,
    courseOfStudy: courseOfStudy,
    author: author,
    supervisor: supervisor,
    client: client,
    expert: expert,
    departement: departement,
  )

  // Start numbering pages after cover
  set page(numbering: "1")

  show: ManagmentSummery.with(body: {
    managmentSummery
  })

  // --- Inhaltsverzeichnis ---
  TableOfContents

  // Use numbered headings
  show heading: set heading(numbering: "1.")
  // Add outlines to outline with target 'heading'
  show outline: set heading(outlined: true)

  // --- Inahlt ---
  doc
  pagebreak()

  // --- Abbildungsverzeichnis ---
  TableOfFigures

  // --- Tabellenverzeichnis ---
  TableOfTables

  // --- Abkürzungsverzeichnis ---
  if abbreviations != none {
    show: ListOfAbbreviations(list: abbreviations)
  }

  // --- Glossar ---
  if glossary != none {
    show: Glossary(list: glossary)
  }

  // --- Literatur- und Quellenverzeichnis ---
  bibliography
  pagebreak()

  // --- Sebständigkeiterklärung ---
  if signatureImage != none and datePlaceImage != none {
    show: DeclarationOfIndependence.with(
      datePlace: datePlaceImage,
      signature: signatureImage,
    )
  } 

  // --- Anhang ---
  if appendice != none {
    pagebreak()
    appendice
  }
}
#let MainCover(
  doc,
  coverImage: none,
  title: none,
  subtitle: none,
  typeOfWork: none,
  courseOfStudy: none,
  author: none,
  supervisor: none,
  client: none,
  expert: none,
  departement: none,
) = {
  let title-size = 24pt
  let subtitle-size = 14pt
  let footer-size = 8pt
  let companyLogoSrc = "../../assets/img/bfh_logo.jpg"

  // Cover-Image
  page({
      box(
        height: 10cm, coverImage
      )
      v(0fr)
      line(stroke: 7pt + yellow, length: 100%) // change to bfh yellow
      v(5mm)
      
      place(
        dy: 1cm,
        dx: 2.5cm,
        grid(
          columns: (1fr),
          row-gutter: 24pt,
          [
            #set text(title-size)
            #title
          ],
          [
            #set text(subtitle-size)
            #subtitle
          ],
          [
            #set text(weight: "bold")
            #typeOfWork
          ]
        )
      )

      // Information
      place(
        dy: 10cm,
        dx: 2.5cm,
        grid(
          columns: (1fr, 1fr),
          row-gutter: 10pt,
          [ 
            Studiengang:
          ],
          [  
            #courseOfStudy
          ],
          [ 
            Autor*in:
          ],
          [
            #author
          ],
          [ 
            Betreuer*in:
          ],
          [
            #supervisor
          ],
          [ 
            Auftraggeber*in:
          ],
          [
            #client
          ],
          [ 
            Expert*in:
          ],
          [
            #expert
          ],

          [ 
            Datum:
          ],
          [
            #datetime.today().display("[day].[month].[year]")
          ],
        )
      )
      
    },
    footer: context {
      place(
        dx: 2.5cm,
        grid(
        columns: (1fr, 1fr),
        align: (bottom),
        [
          #image(companyLogoSrc, height: 2cm)
        ],
        [
          #set text(size: footer-size)
          #departement
        ],
      )
      )
      
        
    }, margin: (top: 0cm, left: 0cm, right: 0cm, bottom: 4.5cm)
  )
  doc
}



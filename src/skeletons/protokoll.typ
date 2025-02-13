/*
  Define footnote to pass and re-use in protocols
  Hide them at this level, to prevent floating footnote orphans in document

  hide[
    #footnote("Typ: P = Pendenz; B = Beschluss; I = Information; D = Diskussion")<typ-label>
  ]
*/

#let protokoll(
  protocol: (
    subject: none,
    dateTime: none,
    location: none,
    attendees: (),
    agendaItems: (
      (
        description: none,
        type: none,
        responsible: none,
        endDate: none,
      ),
    ),
  ),
  typLabel: none,
) = [
  #let fillColor = gray.lighten(50%)

  === #protocol.subject

  #grid(
    columns: 3,
    column-gutter: 2cm,
    [
      *Teilnehmende:*\
      #for attendee in protocol.attendees [
        - #attendee
      ]
    ],
    [
      *Ort:*\
      #protocol.location
    ],
    [
      *Datum:*\
      #protocol.dateTime
    ],
  )

  #show table.cell.where(y: 0): strong

  *Traktanden:*\
  #table(
    columns: 4,
    fill: (_, y) => if y == 0 {
      fillColor
    },
    table.header(
      "Beschreibung",
      "Typ" + typLabel,
      "Verantwortlich",
      "Endtermin",
    ),

    ..for (description, type, responsible, endDate) in protocol.agendaItems {
      (description, type, responsible, endDate)
    }
  )
]

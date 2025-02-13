#let legendeSollIstVergleich() = [
  *Legende SOLL- / IST-Vergleich*

  #show table.cell.where(y: 0): strong
  #figure(
    table(
      columns: 2,
      fill: (_, y) => if y == 0 {
        gray.lighten(50%)
      },
      align: left + horizon,
      table.header(
        [Beschreibung / Regel],
        [Markierung],
      ),
      [SOLL erreicht: SOLL = IST],
      [Keine Markierung],


      table.cell([SOLL unterschritten: SOLL > IST], fill: green),
      table.cell([Grüne Markierung], fill: green),

      table.cell([Soll überschritten: SOLL < IST], fill: red),
      table.cell([Rote Markierung], fill: red),

      table.cell([Ungeplante Arbeit], fill: blue),
      table.cell([Blaue Markierung], fill: blue)
    ),
    caption: [Legende SOLL- / IST-Vergleich Arbeitsjournal.],
  )
]

#let legendePersönlicheStimmung() = [
  *Legende persönliche Stimmung*

  #let symbolFontSize = 20pt
  #show table.cell.where(y: 0): strong
  #show table.cell.where(x: 0): strong
  #figure(
    table(
      columns: 2,
      fill: (_, y) => if y == 0 {
        gray.lighten(50%)
      },
      align: (x, y) => if x == 0 {
        center + horizon
      } else {
        left + horizon
      },
      table.header(
        [Symbol],
        [Bedeutung],
      ),

      table.cell(text("+", size: symbolFontSize)),
      [Sehr positive Stimmungslage: Hohe Arbeitszufriedenheit und Motivation],

      table.cell(text("0", size: symbolFontSize)),
      [Ausgeglichene Stimmungslage: Normale Arbeitszufriedenheit],

      table.cell(text("-", size: symbolFontSize)),
      [Beeinträchtigte Stimmungslage: Verminderte Arbeitszufriedenheit]
    ),
    caption: [Legende persönliche Stimmung Arbeitsjournal.],
  )
]

#let arbeitsjournal(
  tätigkeiten: (
    (
      id: none,
      name: none,
      personen: none,
      soll: none,
      ist: none,
    ),
  ),
  total: (
    soll: none,
    ist: none,
  ),
  tagesablauf: none,
) = {
  let rowIndexAfterTätigkeiten = tätigkeiten.len() + 2


  show table.cell: it => if (it.x == 0 or it.y == 0) and it.y < rowIndexAfterTätigkeiten + 1 {
    strong(it)
  } else { it }

  table(
    columns: 5,
    fill: (_, y) => if y == 0 or y == rowIndexAfterTätigkeiten {
      gray.lighten(50%)
    },
    align: (x, y) => if (x != 1) and y < rowIndexAfterTätigkeiten {
      center + horizon
    } else {
      left + horizon
    },
    table.header(
      [Referenz],
      [Tätigkeit],
      [Beteiligte Personen],
      [SOLL [h]],
      [IST [h]],
    ),

    ..for tätigkeit in tätigkeiten {
      (
        tätigkeit.id,
        tätigkeit.name,
        tätigkeit.personen,
        tätigkeit.soll,
        tätigkeit.ist,
      )
    },

    table.cell(colspan: 3, [*Total SOLL / IST*]),
    total.soll,
    total.ist,

    table.cell(colspan: 5, [Beschreibung des tagesablaufs]),
    table.cell(colspan: 5, tagesablauf)
  )
}

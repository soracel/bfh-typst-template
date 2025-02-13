#let fillColor = gray.lighten(50%)
#let lastRowIndex = 5

#let userStory(
  story: (
    grobanforderungId: none,
    quelle: [Detailbeschrieb],
    autor: [David Lienberger],
    abhängigkeitId: none,
    datum: none,
    status: none,
    name: none,
    beschreibungenUndAnmerkungen: none,
    akzeptanzkriterien: none,
    story: none,
    wichtigkeit: none,
    dringlichkeit: none,
    risiko: none,
    aufwandgrösse: none,
  ),
  wichtigkeitLabel: none,
  dringlichkeitLabel: none,
  risikoLabel: none,
  aufwandgrösseLabel: none,
) = {
  // Use strong text for the following cells
  show table.cell: it => {
    if it.y == 0 {
      // Every second column in the first row
      if calc.odd(it.x) == false {
        strong(it)
      } else {
        it
      }
    } else if it.x == 0 {
      strong(it)
    } else if it.y == lastRowIndex {
      // Every second cell in last row
      if calc.rem(it.x, 3) == 0 {
        strong(it)
      } else {
        it
      }
    } else {
      it
    }
  }

  set text(hyphenate: true)

  table(
    columns: 12,
    align: horizon,
    fill: (x, y) => if y == 0 {
      if calc.odd(x) == false {
        // Fill every second column in the first row
        fillColor
      }
    } else if x == 0 {
      // Fill the first column
      fillColor
    } else if y == lastRowIndex {
      if calc.rem(x, 3) == 0 {
        // Fill every second cell in the last row
        fillColor
      }
    },
    table.header(
      repeat: false,
      "Grobanf.-Id",
      story.grobanforderungId,
      "Quelle",
      story.quelle,
      "Autor",
      story.autor,
      "Abhängig zu",
      story.abhängigkeitId,
      "Datum",
      story.datum,
      "Status",
      story.status,
    ),
    "Name", table.cell(colspan: 11, story.name),
    "Beschreibungen & Anmerkungen", table.cell(colspan: 11, story.beschreibungenUndAnmerkungen),
    "Akzeptanzkriterien", table.cell(colspan: 11, story.akzeptanzkriterien),
    "User-Story", table.cell(colspan: 11, story.story),
    "Wichtigkeit" + wichtigkeitLabel, table.cell(colspan: 2, story.wichtigkeit),
    "Dringlichkeit" + dringlichkeitLabel, table.cell(colspan: 2, story.dringlichkeit),
    "Risiko" + risikoLabel, table.cell(colspan: 2, story.risiko),
    "Aufwandgrösse" + aufwandgrösseLabel, table.cell(colspan: 2, story.aufwandgrösse),
  )
}

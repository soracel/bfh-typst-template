#let testfall(
  id: none,
  bezeichnung: none,
  anwendugnsfallReferenz: none,
  qualitätsAnfordReferenz: none,
  beschreibung: none,
  testvoraussetzungen: none,
  testdaten: none,
  testschritte: none,
  erwartetesErgebnis: none,
) = {
  show table.cell: it => {
    if it.x == 0 or (it.x == 2 and it.y <= 1) {
      strong(it)
    } else {
      it
    }
  }

  figure(
    table(
      columns: (auto, auto, auto, 1fr),
      fill: (x, y) => if x == 0 or x == 2 {
        gray.lighten(50%)
      },
      align: horizon + left,
      [Id], [TF-#id],
      [Bezeichnung], bezeichnung,
      [Anwendungsfall-Ref.], anwendugnsfallReferenz,
      [Qualiätsanforderung-Ref.], qualitätsAnfordReferenz,
      [Beschreibung], table.cell(colspan: 3, beschreibung),
      [Testvoraussetzungen], table.cell(colspan: 3, testvoraussetzungen),
      [Testdaten], table.cell(colspan: 3, testdaten),
      [Testschritte], table.cell(colspan: 3, testschritte),
      [Erwartetes Ergebnis], table.cell(colspan: 3, erwartetesErgebnis),
    ),
    caption: [
      Testfall #id
    ],
  )
}

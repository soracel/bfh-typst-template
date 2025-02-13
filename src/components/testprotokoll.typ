#let manuellerTestProtokoll(
  testfallId: none,
  nameTester: none,
  date: none,
  mängelKlasse: none,
  mängelBeschreibung: none,
  fazitErgebnis: none,
  massnahmen: none,
) = {
  show table.cell.where(x: 0): strong

  figure(
    table(
      columns: (1fr, 1fr),
      fill: (x, _) => if x == 0 {
        gray.lighten(50%)
      },
      align: horizon + left,
      [Testfall-Id], testfallId,
      [Name des Testers], nameTester,
      [Datum des Testlaufs], date,
      [Mängel Klasse], mängelKlasse,
      [Mängel Beschreibung], mängelBeschreibung,
      [Fazit zum Ergebnis], fazitErgebnis,
      [Notwendige Massnahmen], massnahmen,
    ),
    caption: [Testprotokoll für #testfallId.],
  )
}

#let unitTestProtokoll(
  methodName: none,
  unitUnderTest: none,
  nameTester: none,
  date: none,
  result: none,
) = {
  show table.cell.where(x: 0): strong

  figure(
    table(
      columns: (1fr, 1fr),
      fill: (x, _) => if x == 0 {
        gray.lighten(50%)
      },
      align: horizon + left,
      [Methodenname], methodName,
      [Testobjekt (Unit Under Test)], unitUnderTest,
      [Name des Testers], nameTester,
      [Datum des Testlaufs], date,
      [Resultat],
      if result == "PASS" {
        table.cell(result, fill: green)
      } else {
        table.cell(result, fill: red)
      },
    ),
    caption: [Testing-Methode #methodName.],
  )
}

#let e2eTestProtokoll(
  methodName: none,
  anwendungsfallId: none,
  nameTester: none,
  date: none,
  result: none,
) = {
  show table.cell.where(x: 0): strong

  figure(
    table(
      columns: (1fr, 1fr),
      fill: (x, _) => if x == 0 {
        gray.lighten(50%)
      },
      align: horizon + left,
      [Methodenname], methodName,
      [Anwendungsfall Nr.], anwendungsfallId,
      [Name des Testers], nameTester,
      [Datum des Testlaufs], date,
      [Resultat],
      if result == "PASS" {
        table.cell(result, fill: green)
      } else {
        table.cell(result, fill: red)
      },
    ),
    caption: [Testing-Methode #methodName.],
  )
}

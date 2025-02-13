#let grobanforderungen(
  anforderungen: (
    (
      titel: none,
      art: none,
      kriterium: none,
      wichtigkeit: none,
      dringlichkeit: none,
    ),
  ),
) = {
  // Allow breaking table accross pages
  show figure: set block(breakable: true)

  // Fill first column and first row of table with gray
  set table(
    fill: (x, y) => if x == 0 or y == 0 {
      gray.lighten(50%)
    },
  )

  // Use strong text for first column and first row of table
  show table.cell.where(x: 0): strong
  show table.cell.where(y: 0): strong

  set text(hyphenate: true)
  figure(
    table(
      columns: (auto, 5cm, auto, 5cm, auto, auto),
      align: horizon,
      table.header(
        repeat: false, // Do not show table-header on every page
        "Id",
        "Anforderung",
        "Art"
          + footnote("Anforderungsart: F = Funktional; Q = Qualität; S = Sicherheit; A = Architektur; B = Betrieb;
            K = Konformität (Gesetzgebung, Weisungswesen, Normen und Richtlinien)"),
        "Abnahmekriterium",
        "Wichtigkeit"
          + footnote("Wichtigkeit: 5 = zwingend; 4 = sehr wichtig; 3 = wichtig; 2 = normal; 1 = nicht wichtig"),
        "Dringlichkeit"
          + footnote("Dringlichkeit: 5 = sofort; 4 = sehr dringend; 3 = dringend; 2 = normal; 1 = nicht dringend"),
      ),
      ..for (idx, anforderung) in anforderungen.enumerate() {
        (
          str(idx + 1),
          anforderung.titel,
          anforderung.art,
          anforderung.kriterium,
          anforderung.wichtigkeit,
          anforderung.dringlichkeit,
        )
      }
    ),
    caption: "Grobanforderungen",
  )
}

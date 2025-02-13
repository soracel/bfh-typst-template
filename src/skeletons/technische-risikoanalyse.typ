#let technischeRisikoanalyse(
  risks: (
    (
      name: none,
      auswirkung: none,
      sa1: none,
      ew1: none,
      risiko1: (text: none, color: none),
      behandlung1: none,
      massnahme: none,
      sa2: none,
      ew2: none,
      risiko2: (text: none, color: none),
      behandlung2: none,
    ),
  ),
) = [
  #hide[
    #footnote[Schadensausmass: 1 = Führt zu keinem Punkteabzug; 2 = Führt zu Punkteabzug von 0.5 Notenpunkten;
      3 = Führt zu Punkteabzug von über 0.5 Notenpunkten; 4 = Bestehen der IPA gefährdet]<schadensausmass>
  ]
  #hide[
    #footnote[Eintrittswahrscheinlichkeit: 1 = Minimal; 2 = Gering; 3 = Möglich; 4 = Hoch]<eintrittswahrscheinlichkeit>
  ]

  // Move upwards because hidden labels take space on page.
  #v(-1cm)
  // Use strong text for first row of table and center text
  #show table.cell.where(y: 0): strong
  #show table.cell.where(y: 0): set align(center)
  #show table.cell.where(y: 1): strong
  #show table.cell.where(y: 1): set align(center)

  // Break table across pages
  #show figure: set block(breakable: true)
  #figure(
    caption: [Identifizierte Risiken und ihre Auswirkung, Eintrittswahrscheinlichkeit, Behandlung und Massnahmen.],
    table(
      columns: (1cm, 4cm, 3cm, ..(1cm, 1cm, 1.5cm, 2.5cm), 3cm, ..(1cm, 1.5cm, 2.5cm, 2.5cm)),
      align: horizon,
      fill: (_, y) => if y < 2 {
        gray.lighten(50%)
      },
      table.header(
        repeat: true,
        table.cell(rowspan: 2, align: center)[Nr.],
        table.cell(rowspan: 2)[Risikobeschreibung],
        table.cell(rowspan: 2)[Auswirkung],
        table.cell(colspan: 4)[Vor den Massnahmen],
        table.cell(rowspan: 2)[Massnahmen],
        table.cell(colspan: 4)[Nach den Massnahmen],
        // Vor den Massnahmen
        [SA @schadensausmass],
        [EW @eintrittswahrscheinlichkeit],
        [Risiko],
        [Behandlung],
        // Nach den Massnahmen
        [SA @schadensausmass],
        [EW @eintrittswahrscheinlichkeit],
        [Risiko],
        [Behandlung],
      ),

      ..for (idx, risk) in risks.enumerate() {
        (
          str(idx + 1),
          risk.name,
          risk.auswirkung,
          risk.sa1,
          risk.ew1,
          table.cell(risk.risiko1.text, fill: risk.risiko1.color),
          risk.behandlung1,
          risk.massnahme,
          risk.sa2,
          risk.ew2,
          table.cell(risk.risiko2.text, fill: risk.risiko2.color),
          risk.behandlung1,
        )
      }
    ),
  )
]

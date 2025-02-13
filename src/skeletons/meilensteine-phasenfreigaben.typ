#let meilensteinePhasenfreigaben(
  meilensteine: ((title: none, description: none, timestampShould: none, timestampIs: none),),
) = {
  show table.cell.where(y: 0): strong
  figure(
    table(
      columns: 5,
      align: left + horizon,
      fill: (_, y) => if y == 0 {
        gray.lighten(50%)
      },
      table.header([Nr.], [Meilenstein], [Beschreibung], [Zeitpunk geplant], [Zeitpunkt erreicht]),
      ..for (idx, meilenstein) in meilensteine.enumerate() {
        (
          str(idx + 1),
          meilenstein.title,
          meilenstein.description,
          meilenstein.timestampShould,
          meilenstein.timestampIs,
        )
      }
    ),
    caption: [Meilensteine der IPA.],
  )
}


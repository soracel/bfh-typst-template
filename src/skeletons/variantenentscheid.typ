#let kriterium = (
  name: none,
  gewichtung: none,
  erläuterung: none,
)

#let begründung = (
  text: none,
  bewertung: none,
  total: none,
)

#let variante = (
  name: none,
  total: none,
)

#let bewertungssystem(
  kriterien: ((kriterium),),
) = {
  show table.cell.where(x: 0): strong
  show table.cell.where(y: 0): strong
  figure(
    table(
      columns: 4,
      fill: (_, y) => if y == 0 {
        gray.lighten(50%)
      },
      align: horizon + left,
      table.header([Nr.], [Kriterium], [Gewichtung], [Erläuterung]),
      ..for (idx, criteria) in kriterien.enumerate() {
        (
          str(idx + 1),
          criteria.name,
          criteria.gewichtung,
          criteria.erläuterung,
        )
      }
    ),
    caption: [Kriterien zum Variantenentscheid.],
  )

  figure(
    table(
      columns: 2,
      fill: (_, y) => if y == 0 {
        gray.lighten(50%)
      },
      align: horizon + left,
      table.header([Bewertung], [Erläuterung]),
      [2], [Das Kriterium wird erfüllt.],
      [1], [Das Kriterium wird teilweise erfüllt.],
      [0], [Das Kriterium wird nicht erfüllt.],
    ),
    caption: [Bewertungssystem],
  )
}

#let entscheid(
  varianten: (
    one: variante,
    two: variante,
  ),
  kriterien: (
    (
      kriterium
    ),
  ),
  begründungen: (
    (
      one: begründung,
      two: begründung,
    ),
  ),
) = {
  let lastRowIndex = kriterien.len() + 2

  set page(flipped: true, paper: "a3")
  show table.cell.where(y: 0): strong
  show table.cell.where(y: 1): strong
  show table.cell.where(x: 0): strong
  show table.cell.where(y: lastRowIndex, x: 0): strong

  figure(
    table(
      columns: 8,
      fill: (_, y) => if y < 2 {
        gray.lighten(50%)
      } else {
        if y == lastRowIndex {
          gray.lighten(50%)
        }
      },
      align: (x, y) => {
        if (y == 0 or y == lastRowIndex) {
          return horizon + center
        }
        if (x == 0 or x == 2 or x == 5) {
          return horizon + left
        }
        return horizon + center
      },
      table.cell(rowspan: 2)[Kriterium],
      table.cell(rowspan: 2)[Gewichtung],
      table.cell(colspan: 3)[Variante 1: #varianten.one.name],
      table.cell(colspan: 3)[Variante 2: #varianten.two.name],
      [Begründung],
      [Bewertung],
      [Total],

      [Begründung],
      [Bewertung],
      [Total],

      ..for (kriterium, begründung) in kriterien.zip(begründungen) {
        (
          kriterium.name,
          kriterium.gewichtung,
          begründung.one.text,
          begründung.one.bewertung,
          begründung.one.total,
          begründung.two.text,
          begründung.two.bewertung,
          begründung.two.total,
        )
      },

      table.cell(colspan: 2)[Total Bewertung],

      table.cell(colspan: 2)[Variante 1],
      [*#varianten.one.total*],

      table.cell(colspan: 2)[Variante 2],
      [*#varianten.two.total*],
    ),
    caption: [Gegenüberstellung der Varianten],
  )
}

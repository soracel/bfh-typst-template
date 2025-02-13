#let zieleSollSituation(
  headingLevels: 3,
  funktionelleSystemziele: ((goal: none, type: none),),
  qualitätsZiele: ((category: none, goal: none, type: none),),
  vorgehensZiele: ((goal: none, type: none),),
  nichtZiele: ((goal: none),),
) = [
  #let goalCounter = 0;

  #heading(level: headingLevels)[Funktionelle Systemziele]<funktionelle-systemziele>
  Die folgende Tabelle beschreibt die funktionellen Systemziele.
  #figure(
    table(
      columns: 3,
      align: left,
      fill: (_, y) => if y == 0 {
        gray.lighten(50%)
      },
      table.header([Nr.], [Systemziel], [Soll / Muss]),
      ..for goal in funktionelleSystemziele {
        goalCounter += 1
        (
          str(goalCounter),
          goal.goal,
          goal.type,
        )
      }
    ),
    caption: [Systemziele],
  )

  #heading(level: headingLevels)[Qualitätsziele]<qualitätsziele>
  Die folgende Tabelle beschreibt die Qualitätsziele des Systems.
  #figure(
    table(
      columns: 4,
      align: left,
      fill: (_, y) => if y == 0 {
        gray.lighten(50%)
      },
      table.header([Nr.], [Qualitätskategorie], [Qualitätsziel], [Soll / Muss]),
      ..for goal in qualitätsZiele {
        goalCounter += 1
        (str(goalCounter), goal.category, goal.goal, goal.type)
      }
    ),
    caption: [Qualitätsziele],
  )

  #heading(level: headingLevels)[Vorgehensziele]<vorgehensziele>
  Die folgende Tabelle beschreibt die Vorgehensziele dieses Projekts.
  #figure(
    table(
      columns: 3,
      align: left,
      fill: (_, y) => if y == 0 {
        gray.lighten(50%)
      },
      table.header([Nr.], [Vorgehensziel], [Soll / Muss]),
      ..for goal in funktionelleSystemziele {
        goalCounter += 1
        (str(goalCounter), goal.goal, goal.type)
      }
    ),
    caption: [Vorgehensziele],
  )

  #heading(level: headingLevels)[Nichtziele]<nichtziele>
  Die folgende Tabelle beschreibt die Nichtziele dieses Projekts.
  #figure(
    table(
      columns: 2,
      align: left,
      fill: (_, y) => if y == 0 {
        gray.lighten(50%)
      },
      table.header([Nr.], [Nichtziel]),
      ..for goal in funktionelleSystemziele {
        goalCounter += 1
        (str(goalCounter), goal.goal)
      }
    ),
    caption: [Vorgehensziele],
  )
]

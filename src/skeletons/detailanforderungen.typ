#import "../components/user-story.typ": userStory

#let detailanforderungen(
  userStories: (
    (
      grobanforderungId: none,
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
  ),
) = {
  set page(flipped: true)
  // Define footnotes to pass and re-use in userstories
  // Hide them at this level, to prevent floating footnote orphans in document
  hide[
    #footnote("Wichtigkeit: 5 = zwingend; 4 = sehr wichtig; 3 = wichtig; 2 = normal; 1 = nicht wichtig")<wichtigkeit-label>
  ]
  hide[
    #footnote("Dringlichkeit: 5 = sofort; 4 = sehr dringend; 3 = dringend; 2 = normal; 1 = nicht dringend")<dringlichkeit-label>
  ]
  hide[
    #footnote("Risiko: 5 = nicht verantwortbar; 4 = sehr hoch; 3 = mittel; 2 = gering; 1 = ohne")<risiko-label>
  ]
  hide[
    #footnote("Aufwandgrösse: 5 = nicht verantwortbarer; 4 = sehr hoch; 3 = hoch; 2 = im Rahmen; 1 =  vernachlässigbar")<aufwand-label>
  ]


  set align(horizon)
  for (idx, story) in userStories.enumerate() {
    line()
    [Id: ] + str(idx + 1)
    userStory(
      story: story,
      wichtigkeitLabel: [@wichtigkeit-label],
      dringlichkeitLabel: [@dringlichkeit-label],
      risikoLabel: [@risiko-label],
      aufwandgrösseLabel: [@aufwand-label],
    )
    line()
    if idx < userStories.len() {
      pagebreak()
    }
  }
}

#let parseGitLog(logString) = {
  let parts = logString.split(" - ")

  let hash = parts.at(0)
  let uid = parts.at(1)
  let message = parts.at(2)
  let timestamp = parts.at(3)

  return (
    hash: hash,
    uid: uid,
    message: message,
    timestamp: timestamp,
  )
}

#let gitLog(filePath: none, caption: none) = {
  let fileContent = read(filePath)
  let lines = fileContent.split("\n")

  let commits = ()

  for line in lines {
    let log = parseGitLog(line)
    commits.push(log)
  }

  show table.cell.where(y: 0): strong
  figure(
    table(
      columns: 4,
      fill: (_, y) => if y == 0 {
        gray.lighten(50%)
      },
      align: left + horizon,
      table.header(
        [Hash],
        [Autor],
        [Nachricht],
        [Zeitstempel],
      ),

      ..for commit in commits {
        (
          commit.hash,
          commit.uid,
          raw(commit.message),
          commit.timestamp,
        )
      }
    ),
    caption: caption,
  )
}

#let code(content: none, type: none) = {
  // Define theme to use for raw-content
  set raw(theme: "../../assets/snippets-theme.tmTheme")

  // Set a pretty background-color for raw's
  show raw: it => block(
    fill: rgb("#212735"),
    inset: 8pt,
    radius: 2pt,
    text(rgb("#fff"), font: "FiraCode Nerd Font", it),
  )

  let snippetLang = if type == "kt" {
    "kotlin"
  } else if type == "ts" {
    "typescript"
  } else if type == "html" {
    "html"
  } else if type == "scss" {
    "css"
  } else if type == "scss" {
    "css"
  } else if type == "json" {
    "json"
  } else if type == "py" {
    "python"
  } else if type == "sql" {
    "sql"
  } else {
    "text"
  }

  raw(content, lang: snippetLang)
}

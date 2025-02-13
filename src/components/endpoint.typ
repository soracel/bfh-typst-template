#let methodColors = (
  GET: rgb("#61AFFE"),
  HEAD: rgb("#9012FE"),
  POST: rgb("#49CC90"),
  PUT: rgb("#FCA130"),
  DELETE: rgb("#F93E3E"),
  OPTIONS: rgb("#0D5AA7"),
  PATCH: rgb("#50E3C2"),
)

#let endpoint(
  name: none,
  description: none,
  method: none,
  url: none,
  parameters: ((name: none, type: none),),
  requestBody: none,
  responseBodies: ((code: none, body: none),),
) = {
  show table.cell.where(y: 0): strong
  show table.cell.where(x: 0): strong
  show table.cell.where(x: 1, y: 2): strong
  show figure: set block(breakable: true)

  figure(
    table(
      columns: 2,
      fill: (x, y) => if y == 0 or x == 0 {
        gray.lighten(50%)
      },
      align: left + horizon,
      table.header(table.cell(colspan: 2, name)),
      [Beschreibung], description,
      [HTTP-Methode], table.cell(highlight(method, fill: methodColors.at(method.text))),
      [Ressource], [_#url _],
      [Parameter],
      for param in parameters [
        #param.name: #raw(param.type, lang: "json")\
      ],

      [Request Body], raw(requestBody, lang: "json"),
      [Response],
      for (idx, response) in responseBodies.enumerate() [
        *#response.code*: #raw(response.body, lang: "json")
        #if idx < responseBodies.len() - 1 {
          line()
        }
      ],
    ),

    caption: [Endpunkt "#name".],
  )
}

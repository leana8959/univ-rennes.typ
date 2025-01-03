#import "@preview/weave:0.1.0": pipe_

#let conf(
  title,
  author,
  lang: "fr", // oui oui baguette
  font: "New Computer Modern",
  fontsize: 1em,
  with-coverpage: true,
  with-toc: true,
  doc,
) = {
  set document(title: title, author: author)
  set text(size: fontsize, lang: lang, font: font, hyphenate: true)
  set par(justify: true)
  set heading(numbering: "1.1 -")

  show ref: pipe_((underline, emph))
  show link: pipe_((text.with(rgb("#0000EE")), underline, emph))

  if with-coverpage {
    align(right)[
      #stack(
        dir: ttb,
        2fr,
        strong(text(size: 3em)[#title]),
        1.5em,
        emph(text(size: 1.8em)[#author]),
        3fr,
        align(center)[#image("UNIVRENNES_LOGOnoir.svg", height: 4em)],
        2em,
      )
    ]
    pagebreak()
  }

  if with-toc {
    // Separate toplevel outline entries
    show outline.entry.where(level: 1): it => {
      v(1.2em, weak: true)
      strong(it)
    }
    outline(indent: auto)
    pagebreak()
  }

  // Content starts here
  set page(numbering: "1 / 1", number-align: right)
  counter(page).update(_ => 1)

  // Show a smaller title when the coverpage is not visible
  if not with-coverpage {
    set align(center)
    text(size: 2em)[#title - #author]
    v(5em)
  }

  doc
}

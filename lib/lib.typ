#let conf(
  title,
  author,
  lang: "fr",
  font: "New Computer Modern",
  fontsize: 1em,
  /// Fine tune whether this is a long report or not
  with-coverpage: true,
  with-toc: true,
  /// A lambda called with the university's logo by default.
  /// You can - change the logo
  ///         - use another logo
  ///         - etc
  layout-logo: opts => align(center)[#opts.univ-rennes],
  doc,
) = {
  if type(author) == array {
    author = author.join(", ")
  }

  set document(title: title, author: author)
  set text(size: fontsize, lang: lang, font: font, hyphenate: true)
  set par(justify: true)
  set heading(numbering: "1.1 -")

  show ref: underline
  show ref: emph
  show link: text.with(rgb("#0000EE"))
  show link: underline
  show link: emph

  if with-coverpage {
    align(right)[
      #stack(
        dir: ttb,
        2fr,
        strong(text(size: 3em)[#title]),
        1.5em,
        emph(text(size: 1.8em)[#author]),
        3fr,
        layout-logo((
          univ-rennes: image("UNIVRENNES_LOGOnoir.svg", height: 4em),
        )),
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
    let title-text = text(size: 2em)[#title]
    let author-text = text(size: 1.2em)[#author]

    show: box.with(width: 100%)
    set align(center + bottom)
    context if (
      measure(title-text).width > page.width / 3
        or measure(author-text).width > page.width / 3
        or measure(author-text).width + measure(title-text).width > page.width
    ) {
      stack(dir: ttb, title-text, 1em, author-text)
    } else {
      stack(dir: ltr, 7fr, title-text, 1fr, author-text, 7fr)
    }
    v(7em)
  }

  doc
}

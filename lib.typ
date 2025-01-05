#let layout-logo-default(opts) = {
  let logo = opts.univ-rennes
  align(center, logo(height: 4em))
}

#let style-title-default(it) = text(1.6em)[*#it*]
#let style-author-default(it) = text(1.4em)[#it]

#let conf(
  title,
  author,
  lang: "fr",
  font: "New Computer Modern",
  fontsize: 1em,
  /// Fine tune whether this is a long report or not
  with-coverpage: true,
  /// Include a table of content
  with-toc: true,
  /// A lambda called with the university's logo by default.
  layout-logo: layout-logo-default,
  style-title: style-title-default,
  style-author: style-author-default,
  subtitle: [],
  /// Put show rules that should influence the cover page here
  pre-show: x => x,
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

  show: pre-show

  if with-coverpage {
    stack(
      dir: ttb,
      subtitle,
      4em,
      style-title(title),
      5fr,
      style-author(author),
      1fr,
      layout-logo((
        univ-rennes: image.with("assets/UNIVRENNES_LOGOnoir.svg"),
        istic: image.with("assets/istic.png"),
      )),
    )
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
      measure(title-text).width > page.width / 3 or measure(author-text).width > page.width / 3 or measure(author-text).width + measure(title-text).width > page.width
    ) {
      stack(dir: ttb, title-text, 1em, author-text)
    } else {
      stack(dir: ltr, 7fr, title-text, 1fr, author-text, 7fr)
    }
    v(7em)
  }

  doc
}

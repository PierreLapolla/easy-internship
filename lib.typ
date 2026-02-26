#let report(
  doc,
  title: [Internship Report],
  author: "Student Name",
  subtitle: none,
  language: "en",
  font: "Libertinus Serif",
  text_size: 11pt,
  page_margin: (top: 2.5cm, right: 2.5cm, bottom: 2.5cm, left: 2.5cm),
  logo_size: 1cm,
  footer_font_size: 0.8em,
  cover_title_size: 30pt,
  cover_subtitle_size: 18pt,
  keywords: (),
  description: none,
  school_logo: none,
  company_logo: none,
  footer_content: none,
  highlight_color: rgb("#00727A"),
  bib_file: none,
) = {

  if language != "en" and language != "fr" {
    panic("language must be either \"en\" or \"fr\"")
  }
  let font-stack = (
    font,
    "Libertinus Serif"
  )

  set page(paper: "a4", margin: page_margin)
  set text(size: text_size, lang: language, font: font-stack)
  set par(justify: true, first-line-indent: (amount: 1.5em, all: true))
  set heading(numbering: "1.")
  set highlight(fill: highlight_color)
  show heading: it => {
    set text(fill: highlight_color)
    it
  }

  set document(
    title: title,
    author: author,
    date: auto,
    keywords: keywords,
    description: description,
  )

  let display_date = datetime.today().display("[day] [month repr:long] [year]")
  let footer_text = if footer_content == none { author } else { footer_content }
  let header_left = if school_logo != none { image(school_logo, height: logo_size) } else { [] }
  let header_right = if company_logo != none { image(company_logo, height: logo_size) } else { [] }
  let header_content = grid(
    columns: (1fr, 1fr),
    align(left)[#header_left],
    align(right)[#header_right],
  )
  let footer_layout = grid(
    columns: (1fr, auto, 1fr),
    align(left)[#text(size: footer_font_size)[#footer_text]],
    align(center)[#context counter(page).display()],
    align(right)[#text(size: footer_font_size)[#display_date]],
  )

  block(width: 100%, height: 100%)[
    #v(1fr)
    #align(center)[
      #text(size: cover_title_size, weight: "bold")[#title]
      #if subtitle != none {
        v(0.6em)
        text(size: cover_subtitle_size, weight: "medium")[#subtitle]
      }
      #v(1.6em)
      #text(size: 13pt, weight: "semibold")[#author]
      #v(0.5em)
      #text(size: 12pt)[#display_date]
    ]
    #v(1fr)
  ]

  pagebreak()
  set page(header: header_content, footer: footer_layout)
  outline()

  pagebreak()
  doc

  pagebreak()
  let package_bib = bytes(
    "@software{internship-report-typst,\n"
    + "  title = {internship-report: A Typst package for internship reports},\n"
    + "  author = {Pierre Lapolla},\n"
    + "  year = {2026},\n"
    + "  url = {https://github.com/yourname/internship-report},\n"
    + "  note = {Typst package available via Typst Universe}\n"
    + "}\n"
  )
  let refs = if bib_file != none {
    bytes(read(bib_file)) + bytes("\n") + package_bib
  } else {
    package_bib
  }
  hide(cite(<internship-report-typst>))
  bibliography(refs)
}

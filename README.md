# Internship Report Typst Package

A Typst package-style template for internship reports.

## Quick Start

```typst
#import "lib.typ": report

#show: report.with(
  title: [Internship Report],
  author: "Jane Doe",
)

= Introduction
Your report content here.
```

## API

`report(doc; title, author, subtitle, language, font, text_size, page_margin, logo_size, footer_font_size, cover_title_size, cover_subtitle_size, keywords, description, school_logo, company_logo, footer_content, highlight_color, bib_file)`

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `doc` | content | required | Document body captured by `#show`. |
| `title` | content | `[Internship Report]` | Document title metadata and cover title. |
| `author` | string | `"Student Name"` | Author metadata and cover author line. |
| `subtitle` | content/`none` | `none` | Optional subtitle on the cover page. |
| `language` | string | `"en"` | Document language, supported values: `en`, `fr`. |
| `font` | string | `"Libertinus Serif"` | Preferred base font with fallback stack. |
| `text_size` | length | `11pt` | Base body text size. |
| `page_margin` | length/dictionary | `(top: 2.5cm, right: 2.5cm, bottom: 2.5cm, left: 2.5cm)` | Page margins passed to `page(margin: ...)`. |
| `logo_size` | length | `1cm` | Logo height used for `school_logo` and `company_logo`. |
| `footer_font_size` | length | `0.8em` | Font size for footer left/right text. |
| `cover_title_size` | length | `30pt` | Cover title font size. |
| `cover_subtitle_size` | length | `18pt` | Cover subtitle font size. |
| `keywords` | array | `()` | Document metadata keywords. |
| `description` | content/`none` | `none` | Document metadata description. |
| `school_logo` | string/`none` | `none` | Optional logo path shown in header, left side. |
| `company_logo` | string/`none` | `none` | Optional logo path shown in header, right side. |
| `footer_content` | string/`none` | `none` | Left footer text. `none` falls back to `author`. |
| `highlight_color` | color | `rgb("#00727A")` | Color for headings and highlighted elements. |
| `bib_file` | string/`none` | `none` | Optional `.bib` file path merged with package reference entry. |

## License

This project is licensed under the MIT [LICENSE](LICENSE)
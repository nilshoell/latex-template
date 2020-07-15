# LaTeX Thesis Template

This LaTeX template was originally developed by Vel (vel@latextemplates.com) and Johannes Böttcher from [Latextemplates.com](http://www.latextemplates.com/template/masters-doctoral-thesis). After using it for several projects (together with [Christian Hauff](https://github.com/christianhauff)) and finally my bachelor thesis, I recognized that I made several changes to the original template to fit my purposes.

This version is now optimized and prepared for the documentation of programming or software engineering works and comes with a lot of packages I found useful.

- [LaTeX Thesis Template](#latex-thesis-template)
  - [Usage](#usage)
    - [Basic Setup](#basic-setup)
    - [Thesis Information](#thesis-information)
  - [Features](#features)
    - [Translations](#translations)
    - [Print-Mode](#print-mode)
    - [Listings](#listings)
    - [Chapter Referencing](#chapter-referencing)
    - [Figure Referencing](#figure-referencing)
  - [SITM-Compliance](#sitm-compliance)
  - [Development](#development)
  - [License](#license)

## Usage

The template layout was adopted to fit the regulations of my university, but should be easily changed.  
Most (printed) texts are currently in german, but this mainly affects the dummy content.

### Basic Setup

| Key                | Meaning (if true)                                                                                     |
| ------------------ | ----------------------------------------------------------------------------------------------------- |
| `11pt`             | The default document font size, options: 10pt, 11pt, 12pt                                             |
| `oneside`          | Adds empty pages for one-sided printing, use `twoside` for alternating binding margins                |
| `ngerman`          | Language loaded by babel, use `english`, `american` or `naustrian` for the respecting languages                   |
| `singlespacing`    | Single line spacing, alternatives: `onehalfspacing` or `doublespacing`                                |
| `draft`            | Enable draft mode (no pictures, no links, overfull hboxes indicated)                                  |
| `nolistspacing`    | If the document is onehalfspacing or doublespacing; sets spacing in lists to single                   |
| `liststotoc`       | Add the list of figures/tables/etc to the table of contents                                           |
| `toctotoc`         | Add the main table of contents to the table of contents                                               |
| `parskip`          | Add space between paragraphs                                                                          |
| `nohyperref`       | Do not load the hyperref package                                                                      |
| `headsepline`      | Line under the header                                                                                 |
| `chapterinoneline` | Place the chapter title next to the number on one line                                                |
| `consistentlayout` | Change the layout of the declaration, abstract and acknowledgements pages to match the default layout |

### Thesis Information

| Variable       | Meaning                                  | Usage          |
| -------------- | ---------------------------------------- | -------------- |
| `\thesistitle` | Title of the thesis                      | `\ttitle`      |
| `\author`      | Name of the author                       | `\authorname`  |
| `\matnr`      | Matriculation number                       | `\matnumber`  |
| `\mailaddress`      | E-Mail address                       | `\email`  |
| `\addresses`   | Address of the author                    | `\addressname` |
| `\degree`      | Name of the degree (Master/Bachelor/PhD) | `\degreename`  |
| `\supervisor`  | Name of the supervisor                   | `\supname`     |
| `\examiner`    | Name of the examiner                     | `\exaname`     |
| `\subject`     | Subject area                             | `\subjectname` |
| `\university`  | University name                          | `\univname`    |
| `\faculty`     | Faculty name                             | `\facname`     |

## Features

### Translations

The `translations.tex`-file provides a couple of additional translations that are mainly used in custom commands and the title page, and can easily extended with other languages or keywords.

### Print-Mode

Two options are available for prettifying the document if it needs to be printed:

The `\printurl{}{}`-Command (`commands.tex`) works like the standard `\href`, but can be changed to print the url in a footnote, as hyperlinks do somehow not work in printed documents. Just change the definition of the command in line 128 of the `main.tex`-file as follows (Please only activate **one** of the definitions):

```tex
\newcommand{\printurl}[2]{
  % \href{#1}{#2} % Uncomment for standard href
  #2\footnote{#1} % Uncomment for print mode, URL in footnote
}
```

To hide all links you can make them black like the rest of the text (line 187):

```tex
\hypersetup{hidelinks}
```

### Listings

To document source code, the `listings`-package can be used. The full documentation can be found [here](http://mirror.utexas.edu/ctan/macros/latex/contrib/listings/listings.pdf).  
As the language support is rather basic, new languages can be defined for syntax highlighting as follows:

```tex
\lstdefinelanguage{JavaScript}{
  keywords={break, case, catch, continue, debugger, default, delete, do, else, false, finally, for, function, if, in, instanceof, new, null, return, switch, this, throw, true, try, typeof, var, void, while, with},
  morecomment=[l]{//},
  morecomment=[s]{/*}{*/},
  morestring=[b]',
  morestring=[b]",
  sensitive=true
}
```

Special colors have been defined for the background of the listings, comments, keywords and strings and can easily be changed:

```tex
\definecolor{lstbg}{gray}{0.95}
\definecolor{lstComment}{RGB}{51, 102, 0}
\definecolor{lstKey}{RGB}{0, 51, 204}
\definecolor{lstStr}{RGB}{162, 43, 43}
```

### Chapter Referencing

Usually, when I reference another chapter, I would write `see chapter \ref{chap:sample}`. Unfortunately, only the number (or letter) of the chapter is clickable as a link, it would be better to have the whole `chapter 3.1` as a link. As this would require some unreadable construct like

```tex
\hyperref[chapterRef]{chapter \ref{chapterRef}}
```
where you have to get the brackets and braces right, I implemented the commands `\chapref{}` and `\appref{}`. Those will print the link as shown above, with the correct translation of either 'chapter' or 'appendix'.


### Figure Referencing

Just like [chapref](#chapter-referencing), `\figref{fig:sample_figure}` will print `Figure X` (or the translation if set) as a clickable link.


## SITM-Compliance

To be compliant with the thesis template chair for Strategic IT-Management at the UDE, a couple of changes have to be made:

- Change language to `american`
- Change spacing to `onehalfspacing`
- Geometry: `inner=4cm`, `outer=2.5cm`, `bindingoffset=0cm`, `top=2cm`, `bottom=2cm`
- Fonts:
  - Comment out/remove the packages `lmodern` and `mathpazo`
  - Body has to be Times New Roman; provided by the package `mathptmx` (line 82)
  - Standard font for URLs: package `url` and `\urlstyle{same}` (line 85/86)
  - Helvetica (clone of Arial) for Headings/Titles, activate the lines 89-94
- Change page numbering to small roman letters (`\pagenumbering{Roman}` to `\pagenumbering{roman}`; line 202)
- Include the alternative title page: `\input{Base/titlepage_alt.tex}`
- Remove declaration, quotation and acknowledgement pages
- For the abstract, use `\input{Base/abstract_dual.tex}` to get a second heading for the german abstract, without generating a second entry in the toc
- Remove listings (lines 235/236) from toc and document
- Remove the glossary page


## Development

This template is under continuous development and will be updated from time to time.

## License

The template is licensed under the CC BY-NC-SA 4.0 (https://creativecommons.org/licenses/by-nc-sa/4.0/; see also the [License file](LICENSE.md)).  
The `.cls`-File is licensed under the LPPL v1.3c (http://www.latex-project.org/lppl).

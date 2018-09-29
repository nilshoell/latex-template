# latex-template

This LaTeX template was originally developed by Vel (vel@latextemplates.com) and Johannes Böttcher from [Latextemplates.com](http://www.latextemplates.com/template/masters-doctoral-thesis). After using it for several projects (together with [Christian Hauff](https://github.com/christianhauff)) and finally my bachelor thesis, I recognized that I made several changes to the original template to fit my purposes.

This version is now optimized and prepared for the documentation of programming or software engineering works and comes with a lot of packages I found useful.

## Usage

The template layout was adopted to fit the regulations of my university, but should be easily changed.  
Most (printed) texts are currently in german, but this mainly affects the dummy content.

## Features

### Print-Mode

Two options are available for prettifying the document if it needs to be printed:

The `\printurl{}{}`-Command works like the standard `\href`, but can be changed to print the url in a footnote, as hyperlinks do somehow not work in printed documents. Just change the definition of the command in line 95 of the `main.tex`-file as follows (Please only activate **one** of the definitions):

```tex
\newcommand{\printurl}[2]{
  % \href{#1}{#2} % Uncomment for standard href
  #2\footnote{#1} % Uncomment for print mode, URL in footnote
}
```

To hide all links you can make them black like the rest of the text (Line 133):

```tex
\hypersetup{hidelinks=true,}
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

## Development

This template is under continuous development and will be updated from time to time.

## Licence

The template is licensed under the CC BY-NC-SA 3.0 (http://creativecommons.org/licenses/by-nc-sa/3.0/). The `.cls`-File is licensed under the LPPL v1.3c (http://www.latex-project.org/lppl).

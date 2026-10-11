# Raku Guide

[![Publish website](https://github.com/hankache/rakuguide/actions/workflows/publish.yml/badge.svg)](https://github.com/hankache/rakuguide/actions/workflows/publish.yml)
[![Publish PDFs](https://github.com/hankache/rakuguide/actions/workflows/publish-pdf.yml/badge.svg)](https://github.com/hankache/rakuguide/actions/workflows/publish-pdf.yml)
[![Languages: 14](https://img.shields.io/badge/languages-14-0b7cbd)](#read-the-guide)
[![License: CC BY-SA 4.0](https://img.shields.io/badge/license-CC%20BY--SA%204.0-lightgrey)](LICENSE)

This document is intended to give you a quick overview of the Raku programming language.  
For those who are new to Raku it should get you up and running.

### Read the guide

| Language | Online | PDF |
|---|---|---|
| English | [raku.guide](https://raku.guide) | [Download](https://github.com/hankache/rakuguide/releases/download/pdf/rakuguide.pdf) |
| French | [raku.guide/fr](https://raku.guide/fr) | [Download](https://github.com/hankache/rakuguide/releases/download/pdf/rakuguide-fr.pdf) |
| German | [raku.guide/de](https://raku.guide/de) | [Download](https://github.com/hankache/rakuguide/releases/download/pdf/rakuguide-de.pdf) |
| Japanese | [raku.guide/ja](https://raku.guide/ja) | [Download](https://github.com/hankache/rakuguide/releases/download/pdf/rakuguide-ja.pdf) |
| Spanish | [raku.guide/es](https://raku.guide/es) | [Download](https://github.com/hankache/rakuguide/releases/download/pdf/rakuguide-es.pdf) |
| Portuguese | [raku.guide/pt](https://raku.guide/pt) | [Download](https://github.com/hankache/rakuguide/releases/download/pdf/rakuguide-pt.pdf) |
| Dutch | [raku.guide/nl](https://raku.guide/nl) | [Download](https://github.com/hankache/rakuguide/releases/download/pdf/rakuguide-nl.pdf) |
| Bulgarian | [raku.guide/bg](https://raku.guide/bg) | [Download](https://github.com/hankache/rakuguide/releases/download/pdf/rakuguide-bg.pdf) |
| Chinese | [raku.guide/zh](https://raku.guide/zh) | [Download](https://github.com/hankache/rakuguide/releases/download/pdf/rakuguide-zh.pdf) |
| Italian | [raku.guide/it](https://raku.guide/it) | [Download](https://github.com/hankache/rakuguide/releases/download/pdf/rakuguide-it.pdf) |
| Turkish | [raku.guide/tr](https://raku.guide/tr) | [Download](https://github.com/hankache/rakuguide/releases/download/pdf/rakuguide-tr.pdf) |
| Indonesian | [raku.guide/id](https://raku.guide/id) | [Download](https://github.com/hankache/rakuguide/releases/download/pdf/rakuguide-id.pdf) |
| Russian | [raku.guide/ru](https://raku.guide/ru) | [Download](https://github.com/hankache/rakuguide/releases/download/pdf/rakuguide-ru.pdf) |
| Ukrainian | [raku.guide/uk](https://raku.guide/uk) | [Download](https://github.com/hankache/rakuguide/releases/download/pdf/rakuguide-uk.pdf) |

### Building the HTML
The document is written in asciidoc format and generated using
asciidoctor, with syntax highlighting by rouge.  You will need a current
version of **ruby**, **asciidoctor**, **rouge**, and **rouge-raku**, the
plugin that teaches rouge to highlight Raku.

Install the required tools:

    $ sudo gem install asciidoctor
    $ sudo gem install rouge
    $ sudo gem install rouge-raku

To produce **rakuguide.html**, run:

    $ asciidoctor -r rouge-raku rakuguide.adoc

The `-r rouge-raku` option is required. Without it the build still succeeds,
but the Raku code is left unhighlighted.

### Building the PDF
In addition to the tools above, you will need **asciidoctor-pdf**:

    $ sudo gem install asciidoctor-pdf

To produce **rakuguide.pdf**, run:

    $ asciidoctor-pdf -r rouge-raku rakuguide.adoc

The PDF only shows characters found in the fonts it is built with, and the
fonts that come with asciidoctor-pdf do not cover all the scripts used in
the guide. With the command above, some characters in the Unicode examples
appear as empty boxes, and the Japanese and Chinese translations are mostly
unreadable.

To get a complete PDF, with the cover and styling of the published
editions, download these fonts from [Google Fonts](https://fonts.google.com):

* Noto Sans
* Noto Sans Arabic
* Noto Sans KR
* Noto Sans SC
* JetBrains Mono

Create a folder named `fonts` inside the `pdf` folder and copy these files
into it. In each download they are inside the `static` folder:

    pdf/fonts/NotoSans-Regular.ttf
    pdf/fonts/NotoSansArabic-Regular.ttf
    pdf/fonts/NotoSansKR-Regular.ttf
    pdf/fonts/NotoSansSC-Regular.ttf
    pdf/fonts/JetBrainsMono-Regular.ttf
    pdf/fonts/JetBrainsMono-Bold.ttf
    pdf/fonts/JetBrainsMono-Italic.ttf
    pdf/fonts/JetBrainsMono-BoldItalic.ttf

Then create the cover and build with the theme provided in this repository:

    $ pdf/make-cover.sh en
    $ asciidoctor-pdf -r rouge-raku -a pdf-theme=pdf/theme.yml -a rouge-style=github rakuguide.adoc

`make-cover.sh` writes the cover for one language. It takes the greeting
shown under the title from `pdf/greetings.txt`, so run it with the code of
the language you are about to build:

    $ pdf/make-cover.sh fr
    $ asciidoctor-pdf -r rouge-raku -a pdf-theme=pdf/theme.yml -a rouge-style=github fr.rakuguide.adoc

For the Chinese translation, also pass `-a scripts=cjk` so that lines wrap
correctly:

    $ pdf/make-cover.sh zh
    $ asciidoctor-pdf -r rouge-raku -a pdf-theme=pdf/theme.yml -a rouge-style=github -a scripts=cjk zh.rakuguide.adoc

The Japanese translation has its own theme, which draws Japanese text with a
Japanese font:

    $ pdf/make-cover.sh ja
    $ asciidoctor-pdf -r rouge-raku -a pdf-theme=pdf/theme-ja.yml -a rouge-style=github -a scripts=cjk ja.rakuguide.adoc

Add `-a revdate="October 2026"` to print a date on the cover, and `-v` to list
characters that are still missing.

### Printing the PDF as a book
The published PDFs are A4. To print and bind the guide, build it with
`pdf/theme-book.yml` instead. It produces a 7 × 9.25 in (178 × 235 mm) book,
the usual size for programming books:

    $ pdf/make-cover.sh en
    $ asciidoctor-pdf -r rouge-raku -a pdf-theme=pdf/theme-book.yml -a rouge-style=github -a media=prepress rakuguide.adoc

`-a media=prepress` lays the pages out for double-sided printing: the margin
is wider on the binding side, every chapter starts on a right-hand page, and
a blank page follows the cover. Leave it out for single-sided printing.

For the Japanese translation use `pdf/theme-book-ja.yml`, and for Japanese
and Chinese keep `-a scripts=cjk`.

This gives you the inside of the book with a front and back page. It is not
a cover file for a print service: there is no spine, and the artwork does
not extend past the edge of the page.

### Feedback
All feedback is welcomed:
* Corrections
* Suggestions
* Additions
* Translations

### Translations
If you wish to translate this document, always use the English version as your starting point.
If you are starting a new translation create a new file. For example, the French translation will be in fr.rakuguide.adoc, the Deutsch translation in de.rakuguide.adoc  
If you want to modify a translated version, consider modifying the English version first. It is important that all translations be kept in sync.

Currently the translations are in different phases of completion. For completeness rely on the English version.

### Contributing
Kindly prefix your commit title with the language it is targeting. For example, all commits targeting the English version would have a title that starts with [EN]. All commits targeting the Spanish translation have a title that starts with [ES].

### Authors
* Original English version: [Naoum Hankache](https://github.com/hankache)
* French Translation: [Romuald Nuguet](https://github.com/kolikov)
* German Translation: Sören Laird Sörries
* Japanese Translation: [Itsuki Toyota](https://github.com/titsuki)
* Spanish Translation: [Ramiro Encinas](https://github.com/ramiroencinas)
* Portuguese Translation: [Breno G. de Oliveira](https://github.com/garu)
* Dutch Translation: [Elizabeth Mattijsen](https://github.com/lizmat)
* Bulgarian Translation: [Красимир Беров](https://github.com/kberov)
* Chinese Translation: [wenjie1991](https://github.com/wenjie1991) and [ohmycloud](https://ohmycloud.github.io)
* Italian Translation: [MarsMarsico](https://github.com/marsmarsico)
* Turkish Translation: [Yalın Pala](https://github.com/yplog)
* Indonesian Translation: [Heince Kurniawan](https://github.com/heince)
* Russian Translation: [Alexander Kiryuhin](https://github.com/Altai-man)
* Ukrainian Translation: [Dmytro Iaskolko](https://github.com/s0t0na)

For the full list of contributors: https://github.com/hankache/rakuguide/graphs/contributors

### License
Creative Commons Attribution-ShareAlike 4.0 International License.  
To view a copy of this license, visit https://creativecommons.org/licenses/by-sa/4.0/.

# Raku Guide

This document is intended to give you a quick overview of the Raku programming language.  
For those who are new to Raku it should get you up and running.

### Website
For online reading navigate to:  
* English: https://raku.guide
* French: https://raku.guide/fr
* German: https://raku.guide/de
* Japanese: https://raku.guide/ja
* Spanish: https://raku.guide/es
* Portuguese: https://raku.guide/pt
* Dutch: https://raku.guide/nl
* Bulgarian: https://raku.guide/bg
* Chinese: https://raku.guide/zh
* Italian: https://raku.guide/it
* Turkish: https://raku.guide/tr
* Indonesian: https://raku.guide/id
* Russian: https://raku.guide/ru
* Ukrainian: https://raku.guide/uk

### PDF
For offline reading download:
* English: https://github.com/hankache/rakuguide/releases/download/pdf/rakuguide.pdf
* French: https://github.com/hankache/rakuguide/releases/download/pdf/rakuguide-fr.pdf
* German: https://github.com/hankache/rakuguide/releases/download/pdf/rakuguide-de.pdf
* Japanese: https://github.com/hankache/rakuguide/releases/download/pdf/rakuguide-ja.pdf
* Spanish: https://github.com/hankache/rakuguide/releases/download/pdf/rakuguide-es.pdf
* Portuguese: https://github.com/hankache/rakuguide/releases/download/pdf/rakuguide-pt.pdf
* Dutch: https://github.com/hankache/rakuguide/releases/download/pdf/rakuguide-nl.pdf
* Bulgarian: https://github.com/hankache/rakuguide/releases/download/pdf/rakuguide-bg.pdf
* Chinese: https://github.com/hankache/rakuguide/releases/download/pdf/rakuguide-zh.pdf
* Italian: https://github.com/hankache/rakuguide/releases/download/pdf/rakuguide-it.pdf
* Turkish: https://github.com/hankache/rakuguide/releases/download/pdf/rakuguide-tr.pdf
* Indonesian: https://github.com/hankache/rakuguide/releases/download/pdf/rakuguide-id.pdf
* Russian: https://github.com/hankache/rakuguide/releases/download/pdf/rakuguide-ru.pdf
* Ukrainian: https://github.com/hankache/rakuguide/releases/download/pdf/rakuguide-uk.pdf

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

To get a complete PDF, download these fonts from
[Google Fonts](https://fonts.google.com/noto):

* Noto Sans
* Noto Sans Arabic
* Noto Sans KR
* Noto Sans SC

Create a folder named `fonts` inside the `pdf` folder and copy the Regular weight
of each font into it. In each download it is inside the `static` folder:

    pdf/fonts/NotoSans-Regular.ttf
    pdf/fonts/NotoSansArabic-Regular.ttf
    pdf/fonts/NotoSansKR-Regular.ttf
    pdf/fonts/NotoSansSC-Regular.ttf

Then build with the theme provided in this repository:

    $ asciidoctor-pdf -r rouge-raku -a pdf-theme=pdf/theme.yml rakuguide.adoc

For the Chinese translation, also pass `-a scripts=cjk` so that lines wrap
correctly:

    $ asciidoctor-pdf -r rouge-raku -a pdf-theme=pdf/theme.yml -a scripts=cjk zh.rakuguide.adoc

The Japanese translation has its own theme, which draws Japanese text with a
Japanese font:

    $ asciidoctor-pdf -r rouge-raku -a pdf-theme=pdf/theme-ja.yml -a scripts=cjk ja.rakuguide.adoc

Add `-v` to any of these commands to list characters that are still missing.

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

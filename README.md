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

### Building the document
The document is written in asciidoc format and generated using
asciidoctor and pygments.  You will need a current version of **ruby**,
**asciidoctor**, **pygments**, and a special gem that provides a pre-release version
of **asciidoctor-pdf**.

Install the required tools:

    $ sudo pip install Pygments
    $ sudo gem install asciidoctor
    $ sudo gem install asciidoctor-pdf
    $ sudo gem install pygments.rb

To produce **rakuguide.pdf**, run:

    $ asciidoctor-pdf rakuguide.adoc

To produce **rakuguide.html**, run:

    $ asciidoctor rakuguide.adoc

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

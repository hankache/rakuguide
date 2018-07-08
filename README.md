# Perl 6 Introduction

This document is intended to give you a quick overview of the Perl 6 programming language.  
For those who are new to Perl 6 it should get you up and running.

### Website
For online reading navigate to:  
* English: https://perl6intro.com
* French: https://perl6intro.com/fr
* German: https://perl6intro.com/de
* Japanese: https://perl6intro.com/ja
* Spanish: https://perl6intro.com/es
* Portuguese: https://perl6intro.com/pt
* Dutch: https://perl6intro.com/nl
* Bulgarian: https://perl6intro.com/bg
* Chinese: https://perl6intro.com/zh
* Italian: https://perl6intro.com/it
* Turkish: https://perl6intro.com/tr
* Indonesian: https://perl6intro.com/id
* Russian: https://perl6intro.com/ru

### Building the document
The document is written in asciidoc format and generated using
asciidoctor and pygments.  You will need a current version of **ruby**,
**asciidoctor**, **pygments**, and a special gem that provides a pre-release version
of **asciidoctor-pdf**.

Install the required tools:

    $ sudo pip install Pygments
    $ sudo gem install asciidoctor
    $ sudo gem install --pre asciidoctor-pdf
    $ sudo gem install pygments.rb

To produce **perl6intro.pdf**, run:

    $ asciidoctor-pdf perl6intro.adoc

To produce **perl6intro.html**, run:

    $ asciidoctor perl6intro.adoc

### Feedback
All feedback is welcomed:
* Corrections
* Suggestions
* Additions
* Translations

### Translations
If you wish to translate this document, always use the english version as your starting point.
If you are starting a new translation create a new file. For example, the French translation will be in fr.perl6intro.adoc, the Deutsch translation in de.perl6intro.adoc  
If you want to modify a translated version, consider modifying the english version first. It is important that all translations be kept in sync.

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

For the full list of contributors: https://github.com/hankache/perl6intro/graphs/contributors

### License
Creative Commons Attribution-ShareAlike 4.0 International License.  
To view a copy of this license, visit https://creativecommons.org/licenses/by-sa/4.0/.

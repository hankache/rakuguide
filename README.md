# Perl 6 Introduction

This document is intended to give you a quick overview of the Perl 6 programming language.  
For those who are new to Perl 6 it should get you up and running.

### Website
For online reading navigate to:  
* English: http://perl6intro.com
* French: http://fr.perl6intro.com
* German: http://de.perl6intro.com
* Japanese: http://ja.perl6intro.com
* Spanish: http://es.perl6intro.com
* Portuguese: http://pt.perl6intro.com


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

### Translations
If you wish to translate this document, always use the english version as your starting point.
If you are starting a new translation create a new file. For example, the French translation will be in fr.perl6intro.adoc, the Deutsch translation in de.perl6intro.adoc  
If you want to modify a translated version, consider modifying the english version first. It is important that all translations be kept in sync.

### License
Creative Commons Attribution-ShareAlike 4.0 International License.  
To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.

### Feedback
All feedback is welcomed:
* Corrections
* Suggestions
* Additions
* Translations

### Authors
* Original English version: Naoum Hankache
* French Translation: Romuald Nuguet
* German Translation: Sören Laird Sörries
* Japanese Translation: Itsuki Toyota
* Spanish Translation: Ramiro Encinas
* Portuguese Translation: Breno G. de Oliveira

For the full list of contributors: https://github.com/hankache/perl6intro/graphs/contributors

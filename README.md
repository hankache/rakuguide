# Perl 6 Introduction

This document is intended to give you a quick overview of the Perl 6 programming language.  
For those who are new to Perl 6 it should get you up and running.

#### Website
For online reading navigate to:  
http://perl6intro.com

#### Building the document
The document is written in asciidoc format and generated using
asciidoctor and pygments.  You will need a current version of ruby,
pygments, and a special gem that provides a re-release version
ofasciidoctor-pdf. Install it this way:

  $ sudo gem install --pre asciidoctor-pdf

Then run:

  $ asciidoctor-pdf perl6intro.adoc

which should produce **perl6intro.pdf**.

#### Translations
If you wish to translate this document, always use the english version as your starting point. 
If you are starting a new translation create a new file. For example, the French translation will be in fr.perl6intro.adoc, the Deutsch translation in de.perl6intro.adoc  
If you want to modify a translated version, consider modifying the english version first. It is important that all translations be kept in sync.

#### License
Creative Commons Attribution-ShareAlike 4.0 International License.  
To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.

#### Feedback
All feedback is welcomed:
* Corrections
* Suggestions
* Additions
* Translations

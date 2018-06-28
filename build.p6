use File::Directory::Tree;

sub clone() {
  shell 'git clone --branch master https://github.com/hankache/perl6intro.git Src';
}

sub clean-up() {
  rmtree 'Src';
}

sub MAIN(Str $language = 'all') {
  clone();
  given $language {
    when 'all' {
      shell 'asciidoctor -o index.html Src/perl6intro.adoc';
      say "en generated.";
      for indir 'Src',{ map(*.substr(0..1), grep({ .Str ne ('perl6intro.adoc','.git','.gitignore','LICENSE','README.md').any }, dir)).sort } -> $translation {
          mkdir $translation;
          shell "asciidoctor -D $translation -o index.html Src/$translation.perl6intro.adoc";
          say $translation, " translation generated.";
      }
    }
    when 'en' {
      shell 'asciidoctor -o index.html Src/perl6intro.adoc';
      say "en generated.";
    }
    when indir('Src',{ map(*.substr(0..1), grep({ .Str ne 'perl6intro.adoc' }, dir)).sort }).any {
      mkdir $_;
      shell "asciidoctor -D $_ -o index.html Src/$_.perl6intro.adoc";
      say $_, " translation generated.";
    }
    default {
      say "Language not available.";
    }
  }
  clean-up();
}

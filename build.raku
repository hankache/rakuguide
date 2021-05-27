use File::Directory::Tree;

my $gtag = q:to/END/;

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-70405289-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-70405289-1');
</script>
END

my $favicon-en = q:to/END/;
<link rel="shortcut icon" type="image/x-icon" href="favicon.ico">
END
my $favicon-rest = q:to/END/;
<link rel="shortcut icon" type="image/x-icon" href="../favicon.ico">
END

sub clone() {
  shell 'git clone --branch master https://github.com/hankache/rakuguide.git Src';
}

sub clean-up() {
  rmtree 'Src';
}

sub MAIN(Str $language = 'all') {
  clone();
  given $language {
    when 'all' {
      shell 'asciidoctor -o index.html Src/perl6intro.adoc';
      my $html = slurp 'index.html';
      $html .= subst("<head>","<head>" ~ $gtag ~ $favicon-en);
      spurt 'index.html',$html;
      say "en generated.";
      for indir 'Src',{ map(*.substr(0..1), grep({ .Str ne ('perl6intro.adoc','.git','.gitignore','LICENSE','README.md').any }, dir)).sort } -> $translation {
          mkdir $translation;
          shell "asciidoctor -D $translation -o index.html Src/$translation.perl6intro.adoc";
          my $html = slurp "$translation/index.html";
          $html .= subst("<head>","<head>" ~ $gtag ~ $favicon-rest);
          spurt "$translation/index.html",$html;
          say $translation, " translation generated.";
      }
    }
    when 'en' {
      shell 'asciidoctor -o index.html Src/perl6intro.adoc';
      my $html = slurp 'index.html';
      $html .= subst("<head>","<head>" ~ $gtag ~ $favicon-en);
      spurt 'index.html',$html;
      say "en generated.";
    }
    when indir('Src',{ map(*.substr(0..1), grep({ .Str ne 'perl6intro.adoc' }, dir)).sort }).any {
      mkdir $_;
      shell "asciidoctor -D $_ -o index.html Src/$_.perl6intro.adoc";
      my $html = slurp "$_/index.html";
      $html .= subst("<head>","<head>" ~ $gtag ~ $favicon-rest);
      spurt "$_/index.html",$html;
      say $_, " translation generated.";
    }
    default {
      say "Language not available.";
    }
  }
  clean-up();
}

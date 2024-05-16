use File::Directory::Tree;

my $gtag = q:to/END/;

<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-BKRLVLW1G0"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-BKRLVLW1G0');
</script>

<!-- Matomo -->
<script>
  var _paq = window._paq = window._paq || [];
  /* tracker methods like "setCustomDimension" should be called before "trackPageView" */
  _paq.push(["setDocumentTitle", document.domain + "/" + document.title]);
  _paq.push(["setCookieDomain", "*.raku.guide"]);
  _paq.push(["setDomains", ["*.raku.guide"]]);
  _paq.push(["setDoNotTrack", true]);
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
    var u="https://hankache.com/matomo/";
    _paq.push(['setTrackerUrl', u+'matomo.php']);
    _paq.push(['setSiteId', '2']);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.async=true; g.src=u+'matomo.js'; s.parentNode.insertBefore(g,s);
  })();
</script>
<!-- End Matomo Code -->

END

my $favicon-en = q:to/END/;
<link rel="shortcut icon" type="image/x-icon" href="favicon.ico">
END
my $favicon-rest = q:to/END/;
<link rel="shortcut icon" type="image/x-icon" href="../favicon.ico">
END

sub clone() {
  shell 'git clone --branch main https://github.com/hankache/rakuguide.git Src';
}

sub clean-up() {
  rmtree 'Src';
}

sub MAIN(Str $language = 'all') {
  clone();
  given $language {
    when 'all' {
      shell 'asciidoctor -o index.html Src/rakuguide.adoc';
      my $html = slurp 'index.html';
      $html .= subst("<head>","<head>" ~ $gtag ~ $favicon-en);
      spurt 'index.html',$html;
      say "en generated.";
      for indir 'Src',{ map(*.substr(0..1), grep({ .Str ne ('rakuguide.adoc','.git','.gitignore','LICENSE','README.md').any }, dir)).sort } -> $translation {
          mkdir $translation;
          shell "asciidoctor -D $translation -o index.html Src/$translation.rakuguide.adoc";
          my $html = slurp "$translation/index.html";
          $html .= subst("<head>","<head>" ~ $gtag ~ $favicon-rest);
          spurt "$translation/index.html",$html;
          say $translation, " translation generated.";
      }
    }
    when 'en' {
      shell 'asciidoctor -o index.html Src/rakuguide.adoc';
      my $html = slurp 'index.html';
      $html .= subst("<head>","<head>" ~ $gtag ~ $favicon-en);
      spurt 'index.html',$html;
      say "en generated.";
    }
    when indir('Src',{ map(*.substr(0..1), grep({ .Str ne 'rakuguide.adoc' }, dir)).sort }).any {
      mkdir $_;
      shell "asciidoctor -D $_ -o index.html Src/$_.rakuguide.adoc";
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

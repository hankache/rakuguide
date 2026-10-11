#!/bin/sh
# Writes pdf/cover-front.svg for one language: the cover template with a line
# of Raku that prints that language's greeting from greetings.txt, or the
# English one when the language has none.
# Usage: pdf/make-cover.sh [language code]
set -e
dir=$(dirname "$0")
lang="${1:-en}"
greeting=$(sed -n "s/^$lang=//p" "$dir/greetings.txt")
if [ -z "$greeting" ]; then
  greeting=$(sed -n 's/^en=//p' "$dir/greetings.txt")
fi
xml=$(printf '%s' "$greeting" | sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g')
style='y="172" font-size="17" fill="#8DB4C9"'
mono='font-family="JetBrains Mono"'
case "$lang" in
  ja|zh)
    # The code font has no Japanese or Chinese characters, so the greeting is
    # drawn in another font and the three parts are placed by hand. Each code
    # character is 10.2 wide and each character of the greeting is 17 wide.
    case "$lang" in
      ja) font="M+ 1p Fallback" ;;
      zh) font="Noto Sans SC" ;;
    esac
    count=$(printf '%s' "$greeting" | LC_ALL=C.UTF-8 wc -m)
    start=$(awk "BEGIN { print 297.5 - (7 * 10.2 + $count * 17) / 2 }")
    middle=$(awk "BEGIN { print $start + 5 * 10.2 }")
    end=$(awk "BEGIN { print $middle + $count * 17 }")
    line="<text x=\"$start\" $style $mono>say \"</text><text x=\"$middle\" $style font-family=\"$font\">$xml</text><text x=\"$end\" $style $mono>\";</text>"
    ;;
  *)
    line="<text x=\"297.5\" text-anchor=\"middle\" $style $mono>say \"$xml\";</text>"
    ;;
esac
# Escape what is special on the right-hand side of sed.
line=$(printf '%s' "$line" | sed -e 's/[\\&|]/\\&/g')
sed -e "s|@GREETING@|$line|" "$dir/cover-front-template.svg" > "$dir/cover-front.svg"

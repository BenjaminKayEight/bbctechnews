#!/bin/sh
url="feeds.bbci.co.uk/news/technology/rss.xml?edition=uk"
curl --silent "$url" | grep -E '(title>|description>)'|\
  sed -n '4,$p' |\
  sed -e 's/<title>//' -e 's/<\/title>//' -e 's/<description>/  /' \
      -e 's/<\/description>//' -e 's/<!\[CDATA\[//' -e 's/\]\]>//' |\
  fmt

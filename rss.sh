#!/bin/sh

#usage:
# sh naprss.sh URL_BEZ_NAPPEX.GITHUB.IO "titulek prispevku" Popisek popisek popisek
# prvni argument je url, vsechno potom je popisek
# ie:
# sh naprss.sh /posts/unix/freebsd14-bhyve-debian12.html "freebsd14 bhyve"  my adventure with freebsd and bhyve
# titulek musi byt na druhem miste a v uvozovkach, vsechno zatim je popisek prispevku


#path by melo byt tam, kde je zvenku nappex.github.io/index.rss 
#takze tam, kde je v repositari index.html

#db=/lokalni/adresar/kde/se/to/montuje
db=~/webstuff/rss

url=https://nappex.github.io
title="Napierge blog"
desc="this is my rss feed"

rss() {
cat <<eof
<?xml version="1.0" encoding="UTF-8" ?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
<channel>
<atom:link href="$url/index.rss" rel="self" type="application/rss+xml" />
  <title>$title</title>
  <link>$url</link>
  <description>$desc</description>
  <language>en-US</language>

$(cat $db/rss)

</channel>
</rss>
eof
}

rss_item() {
cat <<eof
<item>
    <title>$post_title</title>
    <link>$url/$post_url</link>
    <guid>$url/$post_url</guid>
    <description>
    $post_desc
    </description>
   <pubDate>$(date -u $date +"%a, %d %h %Y %H:%M:%S +0000")</pubDate>
</item>
eof
}

if [[ $1 = rss ]]; then rss; exit; fi

post_url="$1"
post_title="$2"
shift; shift
post_desc="$*"
touch $db/rss

rss_item > $db/tmprss
cat $db/rss >> $db/tmprss
cat $db/tmprss > $db/rss

rss

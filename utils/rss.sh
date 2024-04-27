#!/bin/sh

#usage:
# sh rss.sh URL_BEZ_NAPPEX.GITHUB.IO "titulek prispevku" Popisek popisek popisek
# prvni argument je url, vsechno potom je popisek
# ie:
# sh naprss.sh /posts/unix/freebsd14-bhyve-debian12.html "freebsd14 bhyve"  my adventure with freebsd and bhyve
# titulek musi byt na druhem miste a v uvozovkach, vsechno zatim je popisek prispevku


# path by melo byt tam, kde je zvenku nappex.github.io/feed/index.rss
# takze tam, kde je v repositari index.html

function usage {
    # Display help/usage message
    echo "Usage: $(basename $0) [-h] POST_URL TITLE DESC"
    echo
    echo "Positional arguments:"
    echo "      post_url    url path relative to domain,
                            if post_url is equal 'rss' the current rss
                            is written to stdout and rest of positional
                            arguments are not required"
    echo "      title       title of blog article"
    echo "      desc        description of the blog article"
    echo "Options:"
    echo "      -h          help message"
    exit 1
}

# db=/lokalni/adresar/kde/se/to/montuje
db="$( dirname $( dirname $0 ) )"/helpers/rss

url=https://nappex.github.io
title="Napierge blog"
desc="RSS feed to my blog"

rss() {
cat <<eof
<?xml version="1.0" encoding="UTF-8" ?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
<channel>
<atom:link href="$url/feed/index.rss" rel="self" type="application/rss+xml" />
  <title>$title</title>
  <link>$url</link>
  <description>$desc</description>
  <language>en-US</language>

$(cat $db/rss 2>/dev/null)

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

OPTIONS_STRING=':h'

while getopts ${OPTIONS_STRING} OPTION; do
   case $OPTION in
        h) # display Help message
            usage
            ;;
        ?) # unidentified option: 'getopts' returns a question mark '?'
            echo "Invalid option: [-${OPTARG}]"
            usage
            ;;
   esac
done

if [ -z $1 ] || [ $1 = "rss" ]
then
  rss
  exit
fi

#script_name=$0
# shift move position for $1 by given number
# OPTIND is number of options given in CLI
# OPTIND include name of script saved in $0 as option
# that means if no option is given OPTIND is equal to 1
# The command below means set $1 to parameter after all options given
# by this command we'll change total number of parameters saved in $#
# and we lose var $0 hence we have to save it before we use shift
#shift "$(($OPTIND - 1))"

# the code above do not have to be used
# because it seems that var $# does not include SCRIPT_PATH
# OPTIND is not changin during operations with CLI arguments
# the opposite is $#, which is changing with shift for example
if [[ $# -lt 3 ]]; then
    echo "$(basename $0): illegal number of position arguments"
    usage
fi

post_url="$1"
post_title="$2"
shift; shift
post_desc="$*"
touch $db/rss

rss_item > $db/tmprss
cat $db/rss >> $db/tmprss
cat $db/tmprss > $db/rss

rss


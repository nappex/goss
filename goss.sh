#TODO
# 1) split blocks of code to functions
# 2) copy makrdown source files to this project and keep this data,
# convert these data to html files with LOWDOWN as ssg project
# 3) try to join converted html files with content from makrdown files with
# _head.html and _tail.html
# 4) copy folders with markdown files, each of folder indicates a certain category
# 5) generate index files for each folder, www/posts will contain index.html to list all posts. each folder in www/posts as category will contain index.html which will list all posts for that category. The link Category will list all folders in www/posts/ (e.g. www/posts/python, www/posts/hardware, and so on)
# - stat is not POSIX, you have to do two format strings. One for BSD and one for Linux GNU
# 7) Check if exists html for markdown, render html from md only if html does not alreadz exist
# 8) check other generated pages if you can make some condition which coudl avoid unnecessary generating
# 9) CSS for HTML tag <code> to nice output
#
#


# Enable word splitting by $IFS chars for ZSH
if [ ${SHELL##*/} = "zsh" ]
then
    set -o shwordsplit 2>/dev/null
fi

#TEMPLATES
HEAD_TPL="templates/_head.html"     # 1. part
NAV_TPL="templates/_nav.html"       # 2. part
HEADER_TPL="templates/_header.html" # 3. part
# between 3. and 4. part insert content of yout html page
TAIL_TPL="templates/_tail.html"     # 4. part

# first part of post template, everythign above <main> (incl.)
BEGIN_POST="templates/begin_post.html"
cat $HEAD_TPL >$BEGIN_POST
cat $NAV_TPL >>$BEGIN_POST
cat $HEADER_TPL >>$BEGIN_POST

# last part of post template, everythign below </main> (incl.)
END_POST="templates/end_post.html"
cat $TAIL_TPL >$END_POST

# CREATE POST TEMPLATE
POST_TPL="templates/post.html" # is 1+2+3+4
cat $BEGIN_POST >$POST_TPL
cat $END_POST >>$POST_TPL


#GENERATED PAGES
HOME_PAGE="www/index.html"
POSTS="www/posts/index.html"
PYTHON="www/posts/python/index.html"

#VARIABLES FOR TEXT MODIFICATION
INDENT=6

# Set formatting to get mod_date via stat
# for Linux coreutils stat and BSD stat
if [ $(uname -s) = "Linux" ]
then
    MTIME_FMT="-c %y"
else
    MTIME_FMT="-f %Sm -t %Y-%m-%d"
fi

create_homepage() {
    # list of last modified 10 posts, sorted by option -t
    LAST_MODIFIED_POSTS=$(ls -t www/posts/*/** | grep -vi index.html | head -n 10)
    # find www/posts/ -type f ! -name index.html printf "%"
    #
    # better approach will be to use find we can specify
    # -type f && we specify ! -name index.html && we can print
    # by printf dates of creation and modification a delimit by
    # spaces. Then we have all need information about files which can be
    # used as parameteres

    cat $BEGIN_POST >$HOME_PAGE
    printf "%${INDENT}s<h2>Last modified posts</h2>\n" >>$HOME_PAGE
    printf "%${INDENT}s<ol>\n" >>$HOME_PAGE

    li_indent=$(( ${INDENT} + 2 ))
    for file in $LAST_MODIFIED_POSTS
    do
        title=$(sed -n 's|.*<title>\(.*\)</title>.*|\1|p' $file)
        pub_date=$(sed -n 's|.*date".*content="\(.*\)">.*|\1|p' $file)
        mod_date=$(stat $MTIME_FMT $file | cut -d " " -f 1)

        printf "%${li_indent}s<li><a href=%s>%s</a></br>\n" " " "${file#www}" "$title" >>$HOME_PAGE

        if [ -n "$pub_date" ] && [ "$pub_date" != "$mod_date" ]
        then
            printf "%${li_indent}s<span id=\"pubdate\">Published on: %s</span> | <span id=\"moddate\">Modified on: %s</span></li>\n" " " "$pub_date" "$mod_date" >>$HOME_PAGE
        else
            printf "%${li_indent}s<span class=\"home-pubdate\">Published on: %s</span></li>\n" " " "$pub_date" >>$HOME_PAGE
        fi

    done

    printf "%${INDENT}s</ol>\n" >>$HOME_PAGE
    cat $END_POST >>$HOME_PAGE

    return 0
}

render_md_to_html() {
# $1 - directory with md files
    src="${1:-./src}"
    md_files=$(find ${src%/} -type f -name "*.md")

    meta_license='    <meta name="license" content="https://creativecommons.org/licenses/by/4.0/">'
    link_icon='    <link rel="icon" type="image/png" size="16x16" href="/images/favicon-16x16.png">'

    for file in $md_files
    do
        html_suffix="${file%.md}.html"
        trimmed=$(echo $html_suffix | sed -n 's|^\(\.*/*\)[^/]\{1,\}/||p')
        html_file="www/posts/${trimmed}"
        mkdir -p "${html_file%/*}"


        if [ ! -f $html_file ]
        then
            cat $BEGIN_POST >$html_file

            title=$(lowdown -X title $file)
            sed -i "" "s|<title>.*|<title>$title</title>|" $html_file
            echo "<h1>$title</h1>" >>$html_file

            lowdown \
                --html-no-escapehtml \
                --html-no-skiphtml \
                --parse-no-autolink \
                --html-no-head-ids \
                $file >>$html_file

            #pub_date
            # sed -i "" '/<h1>/ a\'$'\n'"$pub_date"$'\n' $html_file
            # \a append new line after all match
            # sed -i "" '/<meta name/ a\'$'\n'"$meta_license"$'\n' $html_file
            # sed append is challenging to do it posix, by posix it insert
            # to all match I can not resolve to insert after first match
            # with posix
            # Only POSIX solution I've found was with ed
            pub_date=$(lowdown -X date $file)
            pub_date_fmtted=$(printf "%${INDENT}s<p><span id=pubdate>Published on: %s</span></p>\n" " " "$pub_date")
            meta_date_pattern="\(content=\)\"[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}\""
            sed -i "" "s|$meta_date_pattern|\1\"$pub_date\"|" $html_file
            printf "/<h1>/a\n$pub_date_fmtted\n.\nw\nq\n" | ed $html_file >/dev/null
            cat $END_POST >>$html_file
        fi
    done
}


# CREATE PAGES FROM MARKDOWNS FILES
render_md_to_html

# CREATE HOME PAGE
create_homepage

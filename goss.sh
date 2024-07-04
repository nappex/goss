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

capitalize_str() {
    if [ -z "$1" ]; then
        echo "ERROR: capitalize_str missing argument" >&2
        return 1
    fi

    # take first char and upper it
    # then take rest of string from second character
    printf "%s%s\n" "$(printf $1 | cut -c1 | tr '[a-z]' '[A-Z]')" "$(printf $1 | cut -c2-)"

    return 0
}

html_tag_content() {
    local tag="$1"
    local filepath="$2"

    # sed command below print only first occurence of match
    # and print the value of group 1 in match
    sed -n -e '1 s!.*<'"${tag}"'>\(.*\)</'"${tag}"'>.*!\1!p; t' -e '1,// s//\1/p' "$filepath"
}

meta_tag_content_by_name() {
    local name="$1"
    local filepath="$2"

    # .*>$ - means >$ is end of line and .* is before because content has not to be locate
    # at the end of tag in bad html
    # it is a non greedy regex because of [^" >] thats match all char except chars in square brackets
    # but at the end we have to match set of chars which is not contain in group 1
    # we except that the content string will end with ", [[:space:]] or >
    sed -n -e '1 s!.*<meta.*=["]*'"${name}"'["]*.*content=["]*\([^" >]*\)[" >].*$!\1!p; t' -e '1,// s//\1/p' "$filepath"
}

prepare_help_files() {
    echo ""

}

path_to_html_link() {
    local filepath="$1"
    # ${var:-value} if var is undefined or null use the value
    local indent=$(( INDENT + ${2:-2} ))
    local title

    if [ -f $filepath ]; then
        title=$( html_tag_content "title" $filepath )
        local pub_date=$( meta_tag_content_by_name "date" $filepath )
        local mod_date=$(stat $MTIME_FMT $filepath | cut -d " " -f 1)

        if [ -z "$pub_date" ]; then
            echo ERROR Missing publish date: $filepath >&2
            return 1
        fi
    fi

    if [ -z "$title" ]; then
        local filename=$( basename "$filepath" )
        local capitalized="$( capitalize_str "$filename" )"
        title="${capitalized%.*}"
    fi

    # html link has to be created from path which is not leading
    # with $SCRIPT_DIRPATH/www/, www is root path for link
    # and will not exist in production server path
    local html_link="${filepath#"${SCRIPT_DIRPATH%/}"/www}"
    printf "%${indent}s<li><a href=%s>%s</a>" " " "$html_link" "$title"

    if [ -f $filepath ]; then
        printf "\n%${indent}s</br>\n" " "

        if [ "$pub_date" != "$mod_date" ]; then
            printf "%${indent}s<span id=\"pubdate\">Published on: %s</span> | <span id=\"moddate\">Modified on: %s</span></li>\n" " " "$pub_date" "$mod_date"
        else
            printf "%${indent}s<span class=\"home-pubdate\">Published on: %s</span></li>\n" " " "$pub_date"
        fi

    else
        printf "</li>\n"
    fi

    return 0
}

write_html_links_to_file() {
    local files_list="$1"
    local output_file="$2"

    printf "%${INDENT}s<ol>\n" >>$output_file

    for file in $files_list; do
        path_to_html_link $file 2 >>$output_file
    done

    printf "%${INDENT}s</ol>\n" >>$output_file

    return 0
}

random_picture_html() {
    local templates_path="$SCRIPT_DIRPATH/templates/images"
    local img_html_path=$(\
        find "$templates_path" -type f ! -name "*_homepage*"\
            | sort --random-sort \
            | head -n 1
    )

    printf "%s\n" "$img_html_path"

    return 0
}

create_homepage() {
    cat "$SCRIPT_DIRPATH/$BEGIN_POST" >"$SCRIPT_DIRPATH/$HOME_PAGE"
    cat "$SCRIPT_DIRPATH/$IMG_HOMEPAGE" >>"$SCRIPT_DIRPATH/$HOME_PAGE"
    cat "$SCRIPT_DIRPATH/$INTRO_HOMEPAGE" >>"$SCRIPT_DIRPATH/$HOME_PAGE"

    truncate -s 0 "$SCRIPT_DIRPATH/$POSTS_TMPFILE"
    local pub_date
    for file in $POSTS; do
        pub_date=$( meta_tag_content_by_name "date" $file )
        printf "%s %s\n" $pub_date $file >>"$SCRIPT_DIRPATH/$POSTS_TMPFILE"
    done

    cat "$SCRIPT_DIRPATH/$POSTS_TMPFILE" |
        sort -r >"$SCRIPT_DIRPATH/$SORTED_POSTS"

    printf "%${INDENT}s<h2>New posts</h2>\n" >>"$SCRIPT_DIRPATH/$HOME_PAGE"
    write_html_links_to_file "$(cat "$SCRIPT_DIRPATH/$SORTED_POSTS" | head | cut -d " " -f2)" "$SCRIPT_DIRPATH/$HOME_PAGE"

    # random picture
    local random_pic="$(random_picture_html)"
    cat $random_pic >>"$SCRIPT_DIRPATH/$HOME_PAGE"

    # LAST MODIFIES POSTS
    printf "%${INDENT}s<h2>Last modified posts</h2>\n" >>"$SCRIPT_DIRPATH/$HOME_PAGE"
    # find www/posts/ -type f ! -name index.html printf "%"
    # -type f && we specify ! -name index.html && we can print
    # by printf dates of creation and modification and delimit by
    # spaces. Unfortunately not all implemetation of find contains
    # option -printf
    #
    # list of last modified 10 posts, sorted by option -t
    write_html_links_to_file "$(printf "%s\n" $POSTS | head)" "$SCRIPT_DIRPATH/$HOME_PAGE"

    random_pic="$(random_picture_html)"
    cat $random_pic >>"$SCRIPT_DIRPATH/$HOME_PAGE"

    cat "$SCRIPT_DIRPATH/$END_POST" >>"$SCRIPT_DIRPATH/$HOME_PAGE"

    return 0
}

create_posts_page() {
    cat "$SCRIPT_DIRPATH/$BEGIN_POST" >"$SCRIPT_DIRPATH/$POSTS_PAGE"

    local files=$(cat "$SCRIPT_DIRPATH/$SORTED_POSTS" |
                    cut -d " " -f2)

    printf "%${INDENT}s<h2>All posts</h2>\n" >>"$SCRIPT_DIRPATH/$POSTS_PAGE"
    write_html_links_to_file "$files" "$SCRIPT_DIRPATH/$POSTS_PAGE"

    cat "$SCRIPT_DIRPATH/$END_POST" >>"$SCRIPT_DIRPATH/$POSTS_PAGE"
}

render_md_to_html() {
# $1 - directory with md files
    local src="${1:-$SCRIPT_DIRPATH/$MARKDOWNS_SRC}"
    local md_files=$(find ${src%/} -type f -name "*.md")

    local meta_license='    <meta name="license" content="https://creativecommons.org/licenses/by/4.0/">'
    local link_icon='    <link rel="icon" type="image/png" size="16x16" href="/images/favicon-16x16.png">'

    local rel_html_filepath
    local html_filepath
    local title
    local pub_date

    for file in $md_files; do
        # PREPARE relative html filepath
            # 1. all chars to lowercase
            # 2. remove leading src_dir with sed
            # 3. replace md suffix to html
        rel_html_filepath=$( echo $file |
                tr '[A-Z]' '[a-z]' |
                sed -e 's!^\(\.*/*\)[^/]\{1,\}/!!' -e 's!md!html!' )
        # add leading part www/posts before prepared html file path
        html_filepath="$SCRIPT_DIRPATH/$POSTS_DIR/${rel_html_filepath}"
        mkdir -p "${html_filepath%/*}"

        if [ ! -f $html_filepath ]
        then
            cat "$SCRIPT_DIRPATH/$BEGIN_POST" >$html_filepath

            title=$(lowdown -X title $file)
            sed -i "" "s!<title>.*!<title>$title</title>!" $html_filepath
            echo "<h1>$title</h1>" >>$html_filepath

            lowdown \
                --html-no-escapehtml \
                --html-no-skiphtml \
                --parse-no-autolink \
                --html-no-head-ids \
                $file >>$html_filepath

            # pub_date
            pub_date=$(lowdown -X date $file)
            pub_date_fmtted=$(printf "%${INDENT}s<p><span id=pubdate>Published on: %s</span></p>\n" " " "$pub_date")
            meta_date_pattern="\(content=\)\"[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}\""
            # match content="dddd-dd-dd" where content is saved to group 1
            # then replace it with the value saved in group 1 and add a new
            # pub_date extract from markdown metadata
            sed -i "" "s!$meta_date_pattern!\1\"$pub_date\"!" $html_filepath
            # sed -i "" '/<h1>/ a\'$'\n'"$pub_date"$'\n' $html_filepath
            # \a append new line after all match
            # sed -i "" '/<meta name/ a\'$'\n'"$meta_license"$'\n' $html_filepath
            # sed append is challenging to do it posix, by posix it insert
            # to all match I can not resolve to insert after first match
            # with posix
            # Only POSIX solution I've found was with ed
            printf "/<h1>/a\n$pub_date_fmtted\n.\nw\nq\n" | ed $html_filepath >/dev/null
            cat "$SCRIPT_DIRPATH/$END_POST" >>$html_filepath
        else
            printf "[SKIP - markdown rendering] %s already exists\n" "$html_filepath"
        fi
    done
}

generate_index_files() {
    local dir_path="${1%/}"
    local dir_name="$(basename $dir_path)"
    # make uppercase from dir name
    local title=$(echo "$dir_name" | awk '{print toupper($0)}')
    local output_file="${dir_path}/index.html"

    cat "$SCRIPT_DIRPATH/$BEGIN_POST" >$output_file
    echo "<h1>$title</h1>" >>$output_file

    printf "%${INDENT}s<ol>\n" >>$output_file

    for file in $(ls "$dir_path" | grep -vi index.html); do
        filepath="${dir_path}/${file}"
        if [ -d $filepath ]; then
            generate_index_files $filepath
        else
            path_to_html_link $filepath >>$output_file
        fi
    done

    printf "%${INDENT}s</ol>\n" >>$output_file

    cat "$SCRIPT_DIRPATH/$END_POST" >>$output_file
}

categories_page() {
    local category_page="$SCRIPT_DIRPATH/$CATEGORY_PAGE"
    local category_dirpath="$( dirname "$category_page" )"
    if [ ! -d "$category_dirpath" ]; then
        mkdir -p "$category_dirpath" 2>/dev/null
    fi

    cat $BEGIN_POST >$CATEGORY_PAGE
    echo "<h1>CATEGORIES</h1>" >>$category_page

    printf "%${INDENT}s<ol>\n" >>$category_page

    for category in $( find "$SCRIPT_DIRPATH"/www/posts -d 1 -type d ! -name ".*" ); do
        path_to_html_link "${category}/" >>$category_page
    done

    printf "%${INDENT}s</ol>\n" >>$category_page
    cat "$SCRIPT_DIRPATH/$END_POST" >>$category_page
}

# Enable word splitting by $IFS chars for ZSH
if [ ${SHELL##*/} = "zsh" ]
then
    set -o shwordsplit 2>/dev/null
fi

SCRIPT_DIRPATH="$( dirname "$0" )"
source "$SCRIPT_DIRPATH/config.sh"

# Set formatting to get mod_date via stat
# for Linux coreutils stat and BSD stat
if [ $(uname -s) = "Linux" ]
then
    MTIME_FMT="-c %y"
else
    MTIME_FMT="-f %Sm -t %Y-%m-%d"
fi
# all posts sorted descending by modification time
# (recent modified as first)
POSTS="$(ls -t "$SCRIPT_DIRPATH"/www/posts/*/** |
            grep -vi index.html)"


# CREATE PAGES FROM MARKDOWNS FILES
render_md_to_html

# CREATE HOME PAGE
create_homepage

generate_index_files "$SCRIPT_DIRPATH/$POSTS_DIR"

create_posts_page

categories_page

./utils/rss.sh >$RSS

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

Y_or_N() {
    printf "%s (y/N): " "$1"
    read -r answer
    if [ "$answer" != "${answer#[Yy]}" ]
    then
        return 0;
    else
        return 1;
    fi
}

capitalize() {
    if [ -z "$1" ]; then
        echo "ERROR: capitalize - missing argument" >&2
        return 1
    fi

    # take first char and upper it
    local capitalized_char="$(printf $1 | cut -c1 | tr '[a-z]' '[A-Z]')"
    # then take rest of string from second character
    local rest_chars="$(printf $1 | cut -c2-)"

    printf "%s%s\n" "$capitalized_char" "$rest_chars"

    return 0
}

html_tag_content() {
    local tag="$1"
    local filepath="$2"

    # sed command below print only first occurence of match
    # and print the value of group 1 in match
    sed -n -e '1 s!.*<'"${tag}"'>\(.*\)</'"${tag}"'>.*!\1!ip; t' -e '1,// s//\1/ip' "$filepath"
}

meta_tag_content_by_name() {
    local name="$1"
    local filepath="$2"

    # .*>$ - means >$ is end of line and .* is before because content has not to be locate
    # at the end of tag in bad html
    # it is a non greedy regex because of [^" >] thats match all char except chars in square brackets
    # but at the end we have to match set of chars which is not contain in group 1
    # we except that the content string will end with ", [[:space:]] or >
    sed -n -e '1 s!.*<meta.*=["]*'"${name}"'["]*.*content=["]*\([^" >]*\)[" >].*$!\1!ip; t' -e '1,// s//\1/ip' "$filepath"
}

list_filepaths_with_dates() {
    local date_id="$1"
    local filepaths="$2"

    local file_date
    for file in $filepaths; do
        file_date=$( meta_tag_content_by_name "$date_id" $file )
        printf "%s %s\n" $file_date $file
    done

    return 0
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
        local updated=$( meta_tag_content_by_name "updated" $filepath )

        if [ -z "$pub_date" ]; then
            echo ERROR Missing publish date: $filepath >&2
            return 1
        fi
    fi

    if [ -z "$title" ]; then
        local filename=$( basename "$filepath" )
        local capitalized="$( capitalize "$filename" )"
        title="${capitalized%.*}"
    fi

    # html link has to be created from path which is not leading
    # with $SCRIPT_DIRPATH/www/, www is root path for link
    # and will not exist in production server path
    local html_link="${filepath#"${SCRIPT_DIRPATH%/}"/www}"
    printf "%${indent}s<li><a href=%s>%s</a>" " " "$html_link" "$title"

    if [ -f $filepath ]; then
        printf "\n%${indent}s</br>\n" " "

        if [ ! -z "$updated" ] && [ "$pub_date" != "$updated" ]
        then
            # write data about publish date and updated
            printf "%${indent}s<span id=\"pubdate\">Published: %s | </span>" " " "$pub_date"
            printf "<span id=\"updated\">Updated: %s</span></li>\n" "$updated"
        else
            # write data just about publish date
            printf "%${indent}s<span id=\"pubdate\">Published: %s</span></li>\n" " " "$pub_date"
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

    printf "%${INDENT}s<h2>New posts</h2>\n" >>"$SCRIPT_DIRPATH/$HOME_PAGE"
    write_html_links_to_file "$( echo "$POSTS_SORT_BY_PUB_DATE" |
                                 head |
                                 cut -d " " -f2)" "$SCRIPT_DIRPATH/$HOME_PAGE"

    # random picture
    local random_pic="$(random_picture_html)"
    cat $random_pic >>"$SCRIPT_DIRPATH/$HOME_PAGE"

    # LAST MODIFIES POSTS
    printf "%${INDENT}s<h2>Last modified posts</h2>\n" >>"$SCRIPT_DIRPATH/$HOME_PAGE"
    #
    # list of last modified 10 posts, sorted by option -t
    write_html_links_to_file "$( echo "$POSTS_SORT_BY_UPDATED" |
                                 head |
                                 cut -d " " -f2 )" "$SCRIPT_DIRPATH/$HOME_PAGE"

    random_pic="$(random_picture_html)"
    cat $random_pic >>"$SCRIPT_DIRPATH/$HOME_PAGE"

    cat "$SCRIPT_DIRPATH/$END_POST" >>"$SCRIPT_DIRPATH/$HOME_PAGE"

    return 0
}

create_posts_page() {
    cat "$SCRIPT_DIRPATH/$BEGIN_POST" >"$SCRIPT_DIRPATH/$POSTS_PAGE"

    printf "%${INDENT}s<h2>All posts</h2>\n" >>"$SCRIPT_DIRPATH/$POSTS_PAGE"
    write_html_links_to_file "$POSTS" "$SCRIPT_DIRPATH/$POSTS_PAGE"

    cat "$SCRIPT_DIRPATH/$END_POST" >>"$SCRIPT_DIRPATH/$POSTS_PAGE"
}

html_content_from_markdown() {
    local markdown_filepath="$1"

    # publish date
    local pub_date=$(lowdown -X date $markdown_filepath)
    local title=$(lowdown -X title $markdown_filepath)

    # change default date in template specified by developer
    # with new publish date
    sed -e 's!0000-00-00!'"$pub_date"'!' \
        -e 's!<title>.*!<title>'"$title"'</title>!' \
        "$SCRIPT_DIRPATH/$BEGIN_POST"

    echo "<h1>$title</h1>"
    echo "<p><span id=pubdate>Published: $pub_date</span></p>"
    echo "<!-- Content below is generated with lowdown (https://kristaps.bsd.lv/lowdown/) -->"

    lowdown \
        --html-no-escapehtml \
        --html-no-skiphtml \
        --parse-no-autolink \
        --html-no-head-ids \
        $file

    cat "$SCRIPT_DIRPATH/$END_POST"

    return 0
}

produce_html_from_md_files() {
    # $1 - directory with md files
    local src="${1:-$SCRIPT_DIRPATH/$MARKDOWNS_SRC}"
    local md_files=$(find ${src%/} -type f -name "*.md")

    local rel_html_filepath
    local html_filepath
    local md_updated
    local html_updated
    local meta_tag_updated
    local span_updated

    for file in $md_files; do
        # PREPARE relative html filepath from markdown filepath
            # 1. all chars to lowercase
            # 2. remove leading src_dir with sed
            # 3. replace md suffix to html
        rel_html_filepath=$( echo $file |
                tr '[A-Z]' '[a-z]' |
                sed -e 's!^\(\.*/*\)[^/]\{1,\}/!!' -e 's!.md$!.html!' )
        # add leading part www/posts before prepared html file path
        html_filepath="$SCRIPT_DIRPATH/$POSTS_DIR/${rel_html_filepath}"
        mkdir -p "${html_filepath%/*}"

        if [ ! -f $html_filepath ]
        then
            html_content_from_markdown "$file" >$html_filepath
        else
            md_updated=$( lowdown -X updated "$file" 2>/dev/null )
            html_updated=$( meta_tag_content_by_name updated "$html_filepath" 2>/dev/null )

            if [ ! -z "$md_updated" ] && [ "$md_updated" != "$html_updated" ]
            then
                echo "Markdown file was updated $file"
                echo "$file updated: $md_updated"
                echo "$html_filepath updated: $html_updated"
                Y_or_N "Remove and generate new HTML file from markdown" &&
                    rm $html_filepath &&
                    html_content_from_markdown $file >$html_filepath
                if [ $? -eq 0 ]
                then
                    meta_tag_updated="<meta"
                    meta_tag_updated="$meta_tag_updated"' name="updated"'
                    meta_tag_updated="$meta_tag_updated"' scheme="YYYY-MM-DD"'
                    meta_tag_updated="$meta_tag_updated"' content="'"$md_updated"'">'
                    printf '/meta name="date"/a\n'"\t$meta_tag_updated"'\n.\nw\nq\nr' |
                        ed $html_filepath >/dev/null

                    span_updated="<p><span id=updated>Updated: $md_updated</span></p>"
                    printf "/span id=pubdate/a\n$span_updated\n.\nw\nq\nr" |
                        ed $html_filepath >/dev/null
                fi
            else
                printf "[SKIP - markdown rendering] %s already exists\n" "$html_filepath"
            fi
        fi
    done

    return 0
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

# all posts sorted descending by modification time
# (recent modified as first)
POSTS="$(ls "$SCRIPT_DIRPATH"/www/posts/*/** | grep -vi index.html)"
POSTS_SORT_BY_PUB_DATE=$(list_filepaths_with_dates "date" "$POSTS" | sort -r)
POSTS_SORT_BY_UPDATED=$(list_filepaths_with_dates "updated" "$POSTS" | sort -r)

# CREATE PAGES FROM MARKDOWNS FILES
produce_html_from_md_files

# CREATE HOME PAGE
create_homepage

generate_index_files "$SCRIPT_DIRPATH/$POSTS_DIR"

create_posts_page

categories_page

./utils/rss.sh >$RSS

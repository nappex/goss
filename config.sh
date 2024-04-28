
# CONFIG FILE
#TEMPLATES
readonly HEAD_TPL="templates/_head.html"     # 1. part
readonly NAV_TPL="templates/_nav.html"       # 2. part
readonly HEADER_TPL="templates/_header.html" # 3. part
# between 3. and 4. part insert content of yout html page
readonly TAIL_TPL="templates/_tail.html"     # 4. part

readonly IMG_HOMEPAGE="templates/images/_img_homepage.html"     # 4. part
readonly INTRO_HOMEPAGE="templates/_intro_homepage.html"     # 4. part

# first part of post template, everythign above <main> (incl.)
readonly BEGIN_POST="templates/begin_post.html"
cat $HEAD_TPL >$BEGIN_POST
cat $NAV_TPL >>$BEGIN_POST
cat $HEADER_TPL >>$BEGIN_POST

# last part of post template, everythign below </main> (incl.)
readonly END_POST="templates/end_post.html"
cat $TAIL_TPL >$END_POST

# CREATE POST TEMPLATE
readonly POST_TPL="templates/post.html" # is 1+2+3+4
cat $BEGIN_POST >$POST_TPL
cat $END_POST >>$POST_TPL

# CONSTANTS
readonly SORTED_POSTS="helpers/sorted_posts.txt"
readonly POSTS_TMPFILE="helpers/tmp_posts"
readonly POSTS_DIR="www/posts"
readonly MARKDOWNS_SRC="src"

#GENERATED PAGES
readonly HOME_PAGE="www/index.html"
readonly POSTS_PAGE="www/posts/index.html"
readonly CATEGORY_PAGE="www/categories/index.html"
readonly PYTHON="www/posts/python/index.html"
readonly RSS="www/feed/index.rss"

#VARIABLES FOR TEXT MODIFICATION
readonly INDENT=6


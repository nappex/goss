---
Title: How I've published my pelican blog
Date: 2020-11-02
Category: Python
Tags: python, beginners
Slug: blog-publish-me
Authors: David
Summary: My tutorial to how I handle publushing blog on GitHub pages
Status: published
---

This is not a common article it is just instructions for myself how to publish my blog. How I invented structure of git and branches to publish my blog.


# Blog factory - main folder (pelican-blog/)

You created first folder in your PC as pelican-blog. That blog became your first local repo. There is source raw data of everything. Every article in .md, your settings for pelican tool, your makefile, your pelican theme, your pelican plugin etc.

This folder you can imagine as factory for creation of static sites.

For this repo you have one branch - `master`,

and one remote - your github with repo `nappex.github.io`

Everytime when you done some changes in factory you can send your changes like that:

```
$ git add -A
$ git commit -m "your message"
$ git push origin master
```

# Blog output (with static pages) - subfolder (output/)

When you want to run static sites on GitHub pages, theres is recommendation to push your statis pages to branch with name `gh-pages`

So you've created new folder with name output which is situates as subfolder of folder pelican-blog. And you make another repo from this folder with:

Only one branch - `gh-pages`,

and one remote - your github with repo `nappex.github.io`

When you want to publish new output of static pages to GitHub, you have to make new outpu from factory.

```
$ source venv/bin/activate
```

for activation virtual environment where is installed pelican tool

```
$ make html
```

[more info in pelican documentation](https://docs.getpelican.com/en/stable/publish.html)

After that we generate new content of output/ folder. By default is rewrite whole content of this folder with new files so `.git` file will be deleted. When we want to preserve file `.git` we have to append variable `OUTPUT_RETENTION`, with values as a list with names of files to be preserved, to configuration file `pelicanconf.py` situated in factory folder. The second variable describe path to output folder for html files.

```
OUTPUT_RETENTION = [".git"]
OUTPUT_PATH = 'output/'
```

When all files are generated we can push our changes to see them all world.
You have to change your main repo to subrepo of output folder.

```
$ cd output/
$ git add -A
$ git commit -m "Your message"
$ git push origin gh-pages
```

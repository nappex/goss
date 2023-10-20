---
Title: Git - advanced syntax
Date: 2021-04-08
modified: 2021-04-08
Category: Git
Tags: git, advanced
Slug: git-special-syntax
Authors: David
Summary: Tricks, tips and uncommon Syntax
Status: published
---

![git logo]({static}/images/git_logo.jpg)

[TOC]


# Push local branch to different remote branch ?

This trick can be seemed as:

```shell
$ git push origin local_branchname:remote_branchname
```

- origin -> name of remote


You make some changes in your local branch which you wanna push to another branch in your GitHub repo. In this case is special syntax delimitr `:`. You separate your local branch and remote branch with `:`.
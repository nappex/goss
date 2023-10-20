---
Title: Search files from multiply sources with unix
Date: 2023-02-24
Category: unix
Tags: advanced, tools, unix
Slug: search-files-multi-sources
Authors: David
Summary: How to quickly grep filename in content of multiple directories
Status: published
---

[TOC]

# Introduction
I have a problem find files with my mac on windows server, especially if I am
searching through several directories. The search engine in finder is unusable for me.

# find command
I've began solve this problem with `find` command.

```sh
$ find dir1 dir2 -d 1 -type d -name \*hello\*
```

Command above do: find in directories with paths ./dir1 ./dir2, files and directries whose name contains string `hello`. Option -d means depth and we want to find only files and directories whose are one level below of search parent. So we are searching dir1/* not dir1/*/*...

Unfortunately this approach is slow also.

# ls command
I was searching how can I use command `ls` in similar way as command `find`.
I luckily found the solution. There was problem that `ls` printing only names of found files. But when you are searching through several directories you need to know absolute path or at least part of path by you can distinguish source dir of the found it file. That can be done with option `-d` and env variable `$PWD`

```sh
$ ls -d "$PWD"/dir1/* "$PWD"/dir2/* | grep -F hello
```

Command above do: list all files in dir1 and dir2 with full path which is ensured by option `-d` and `$PWD`. This approach need to contain asterisk at the end of path. Result is piped to grep which filter name that contains string hello.


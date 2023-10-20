---
Title: Differences between zsh and bash
Date: 2022-04-11
Category: Shell
Tags: linux, shell, beginner
Slug: zsh-bash-diffs
Authors: David
Summary: Main (confusing) differences between zsh and bash
Status: published
---

[TOC]

# Introduction
This article aims only to differences between zsh and bash. Author has no
experiences with others. Both of them are categorized as unix shells.

## Sh (Bourne Shell)
This unix shell is not a subject of this article, but I'd like to mention it
because its name **Bourne shell** could be confused as `bash` by beginners.
This shell was created in 1977 by Stephen R. Bourne, who worked in AT&T Bell Laboratories.
This shell can be found in most of today's unix computers under the path `/bin/sh`.
Bourne shell was a replacement for the Thompson shell, whose executable
file had the same path `/bin/sh`.

## Bash (Bourne again shell)
Bash is unix POSIX shell which was created by Free Software Foundation (FSF).
Development started in 1988 by Brian Fox as replacement for `sh`. Syntax
of `bash` is a *superset* of the Bourne shell. It can call it as extension of
the bourne shell or advanced bourne shell, because `bash` has a lot extra features
against to bourne shell, but syntax is preserved as the bourne shell.
Bash is used in most of nowadays linux distributions as default shell under the
path `/bin/bash`.
MacOS used `bash` as default shell until 2019, when they've switched
to `zsh`. One of reason why Apple chnaged was a new license **GPL-3.0** for `bash` 4.0.

## Zsh (Z shell)
Zsh is also unix shell under license MIT. Zsh is extended bourne shell with
much improvements. Zsh also added some really favorite functions from `ksh`, `bash`
and `tcsh`. Original author of `zsh` was Paul Falstad who created the `zsh`
during his study on Princeton University and the name of `zsh` was created
by his professor Zhong Shao. Zsh can be call as *command and programming language*.
`zsh` is used in MacOS or Kali Linux nowadays. Path to execute this shell is `/bin/zsh`.

# Differences between ZSH and BASH

## Word splitting upon parameter expansion

**Word Splitting**
Space is taken as special `char` which separate each arguments and commands.
So if we save some text with spaces to shell variable, we have to remember,
when we'd like to expansion this variable.

**Parameter Expansion (Substitution)**
If we want to use *expansion* we have to use dollar-sign as `syntax`. When we
use dollar-sign before to var name, content of variable will expand to command line
and we can use the content with some command.

*bash*

```bash
$ /bin/bash
$ a="a b c d"
$ printf '<%s>\n' $a
<a>
<b>
<c>
<d>
```

As you can see in example above, parameter expansion evaluate each word separate
by space as one argument for command `printf`. If we dont want to allow word
splitting after parameter expansion we have to put the expansion to double-quotes
*"* in bash.

```bash
$ /bin/bash
$ a="a b c d"
$ printf '<%s>\n' "$a"
<a b c d>
```

But this approach will not work in `zsh`, because word splitting is disable
by default. So there is opposite situation how enable word splitting upon
parameter expansion?

*zsh*

Word splitting is disable by default

```zsh
$ /bin/zsh
$ a="a b c d"
$ printf '<%s>\n' $a
<a b c d>
```

It does not matter in `zsh` if we used double-quotes to disable word splitting
upon parameter expansion (or substition) because of default disabled value.

```zsh
$ /bin/zsh
$ a="a b c d"
$ printf '<%s>\n' "$a"
<a b c d>
```

So if we want to use word splitting we have to use special syntax `=` for perform
word splitting.

```zsh
$ /bin/zsh
$ a="a b c d"
$ printf '<%s>\n' $=a
<a>
<b>
<c>
<d>
```

Word splitting upon parametr expansion could be set globally with option `shwordsplit`.

## Globbing pattern upon parameter expansion

Glob is command which is able to match filenames by pattern which we created.
Paterrns consists of basic wildcards as:

* `*` - match any number and any character in filename including also none
* `?` - match exactly one any character
* `[abc]` - match exactly one character which is `a`, `b` or `c`
* `[b-g]` - match exactly one character which is in range `b-g`

, where each wildcard has own special meaning. Dont confuse `globbing` with
`regex`. Although it is similar concept, there is absolutely different usage.
By default `glob` does not match hidden files start with dot `.`.

Glob pattern can be saved in shell variable. There occurs problem with
parameter (variable) expansion again.

*bash*

```bash
$ /bin/bash
$ a=*
$ ls $a
a.txt	b.txt	c.txt	d.txt
```

As you can see in example above, expansion is proceeded that asterisk is taken
as glob wildcard.

```bash
$ /bin/bash
$ a=*
$ ls "$a"
ls: *: No such file or directory
```

When we used double-quoutes, asterisk is used as text (string) after expansion
and command takes asterisk as filename not as wildcard. If we've really created
file with name * then `ls` will not invoke exception.

*zsh*

Globbing upon parameter expansion is disabled by default, so asterisk is not used
as pattern for globbing but like filename.

```zsh
$ /bin/zsh
$ a=*
$ ls $a
ls: *: No such file or directory
```

If we want to enable pattern globbing after expansion we have to use special
syntax `~`.

```zsh
$ /bin/zsh
$ a=*
$ ls $~a
a.txt b.txt c.txt d.txt
```

We can use different approach and save to parameter at the beginning
by running glob pattern in subshell. Subshell start by run the command
in **simple parentheses**.
So during expansion there will not be the asterisk char but filenames
matched by glob in subshell.

```zsh
$ /bin/zsh
$ a=( * )
$ ls $a
a.txt b.txt c.txt d.txt
```

Globbing upon parametr expansion could be set in `zsh` globally with option `globsubst`.

## ZSH word split and glob expansion together
There is also option to combine special syntax for
* word splitting upon expansion `=`
* and globbing upon expansion `~`.

```zsh
$ /bin/zsh
$ $=~a
```


# Useful links

* [unix-stackexchange-expands-in-bash-but-no-zsh](https://unix.stackexchange.com/questions/461360/glob-character-within-variable-expands-in-bash-but-not-zsh)
* [bash-course-ytb](https://www.youtube.com/playlist?list=PLHS-Uhp7t2Ys5lwy-5jops3t_DCfpXu_j)

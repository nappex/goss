---
Title: How to write POSIX shell script
Date: 2023-02-26
Category: unix, shell, posix
Tags: advanced, unix, shell, posix
Slug: write-posix-shell-script
Authors: David
Summary: How to write highly portable shell script
Status: published
---

[TOC]

# Introduction

Bourne shell - was the default shell for Version 7 Unix. Unix-like systems continue to have `/bin/sh`—which will be the Bourne shell, but rather a symbolic link or hard link to a compatible shell(ksh, bash, zsh, ...)—even when other shells are used by most users.[3]

POSIX - The Portable Operating System Interface (POSIX, with pos pronounced as in positive, not as in pose[1]) is a family of standards specified by the IEEE Computer Society for maintaining compatibility between operating systems.[2]

Nowadays `/bin/sh` is not a Bourne shell on any system anymore.
Even the Solaris was one of the last major system which included it has now switched to a POSIX `sh` for its `/bin/sh` in Solaris 11.[1]
During early 70s the `/bin/sh` was the **Thompson shell**.[1]
The **Bourne shell** replaced the **Thompson shell** in Unix V7 in 1979.[1]
The `/bin/sh` has been the **Bourne shell** for many years thereafter (or the **Almquist shell**, a free reimplementation on BSDs).[1]

One shell that is compatible with most other simple shells, is dash, Debian default system shell, which is a derivative of the older BSD ash.[6]

# Portability

Unfortunately, making a shell script 'POSIX-compliant' is usually easier than making it run on any real-world shell. The only real-world sensible recommendation is test your script in several shells. Like the list: dash, posh, lksh, and bash --posix. Solaris is a world on its own, probably you will need to test against /bin/sh and xpg4/sh.[6]


Unfortunately, **'portable'** is usually a stronger requirement than **'POSIX-compliant'** for shell scripts. That is, writing something that runs on any POSIX shell isn't too hard, but getting it to run on any **real-world shell** is harder.[7]

You can start by installing every shell in your package manager, in particular debian's **posh** sounds like what you want (Policy-compliant Ordinary SHell). Debian's policy is POSIX with a few exceptions (echo -n specified, local...).[7]

Beyond that though, testing has to cover a few shells (/bin/sh especially) on a range of platforms. I test on Solaris (/bin/sh and xpg4/sh), and BSD. AIX and HP-UX are very compliant and don't cause problems. bash is a little world of its own.[7]

I'd recommend the [Autoconf guide to portable shell](http://www.gnu.org/software/autoconf/manual/autoconf.html#Portable-Shell), which is absolutely brilliant and saves a lot of time. Large chunks of it are obsolete, but that's OK; just skip TruUnix and Ultrix and so on if you don't care![7]

# Arrays

The Bourne shell or the POSIX sh language specification don't support arrays. Or rather they have only one array: the positional parameters ($1, $2, $@, so one array per function as well).[1]

`ksh88` did have arrays which you set with `$ set -A`, but that **didn't get specified in the POSIX sh** as the syntax is **awkward** and **not very usable!!!**[1] Example: `$ set -A array_name 1 2 3`, but when you run this line in bash you have a problem. Do not use this kind of array in POSIX shell script.

Other shells with array/lists variables include: `csh/tcsh`, `rc`, `es`, `bash`, `yash`, `zsh`, `fish` each handle arrays with a different syntax.
`csh/tcsh`, `rc`, `es`, `bash`  mostly copied the ksh syntax the ksh93 way.
`rc` the shell of the once to-be successor of Unix.
`fish` and `zsh` being the most consistent ones.[1]

In standard `sh` (also works in modern versions of the Bourne shell):

```sh
set '1st element' 2 3 # setting the array

set -- "$@" more # adding elements to the end of the array

shift 2 # removing elements (here 2) from the beginning of the array

printf '<%s>\n' "$@"    # passing all the elements of the $@ array
                        # as arguments to a command

for i do # looping over the  elements of the $@ array ($1, $2...)
  printf 'Looping over "%s"\n' "$i"
done

printf '%s\n' "$1" # accessing individual element of the array.
                   # up to the 9th only with the Bourne shell though
                   # (only the Bourne shell), and note that you need
                   # the braces (as in "${10}") past the 9th in other
                   # shells (except zsh, when not in sh emulation and
                   # most ash-based shells).

printf '%s\n' "$# elements in the array"

printf '%s\n' "$*" # join the elements of the array with the
                   # first character (byte in some implementations)
                   # of $IFS (not in the Bourne shell where it's on
                   # space instead regardless of the value of $IFS)
```
Note:
In the Bourne shell and ksh88, $IFS must contain the space character for "$@" to work properly (a bug), and in the Bourne shell, you can't access elements above $9 (${10} won't work, you can still do shift 1; echo "$9" or loop over them)).[1]

Also check:
[POSIX shell array article](https://www.baeldung.com/linux/posix-shell-array), where is recommend to use the command `set` with double-dash. The double-dash mark the end of options.

```sh
$ set -- 1 2 3
```
Manual page of `ksh93` say about `set --` following:

`--`      Do not change any of the options; useful in setting $1 to a value beginning with -. If no arguments follow this option then the positional parameters are unset.

[stackoverflow topic](https://stackoverflow.com/questions/53747156/array-under-sh-shell-not-bash)

# Sources

- [1] [stackexchange answer](https://unix.stackexchange.com/questions/137566/arrays-in-unix-bourne-shell/137571#137571)
- [2] [wikipedia POSIX](https://en.wikipedia.org/wiki/POSIX)
- [3] [wikipedia Bourne shell](https://en.wikipedia.org/wiki/Bourne_shell)
- [4] [POSIX shell scripting](https://steinbaugh.com/posts/posix.html)
- [5] Check POSIX syntax of your script [online](https://www.shellcheck.net/)
- [6] [stackoverflow answer](https://stackoverflow.com/a/40922501)
- [7] [unix.stackexchange answer](https://unix.stackexchange.com/questions/48786/how-can-i-test-for-posix-compliance-of-shell-scripts)


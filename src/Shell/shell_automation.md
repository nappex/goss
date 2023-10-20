---
Title: Automate your workflow with shell script
Date: 2021-11-22
Category: Linux
Tags: linux, beginner
Slug: workflow-automation
Authors: David
Summary: How you can automate you often task by write your commands to shell script
Status: published
---

[TOC]

# Executable files

To make your script executable is necessary to set shebangs and add permissions to file.

Files can be used for three main mode:

* `r` - read mode
* `w` - write mode
* `x` - executable mode

If we want to run our script by clicking on it or by command `./script_name` we need
to set up executable mode to this file. Otherwise we are not able to run this script.

Check what modes are set up on your files run command `ls` with option `-l`. It
shows you file in your folder includes information about modes something like
`drwxr-xr-x`.

```shell
ls -l
```

the schmema `drwxr-xr-x` means from left to right:

* first char which is equal to `d` means this file is `directory`, when you just
slash `-` on this position then means the file is normal file.
* next three chars `rwx` means setup permissions for `user` or `u`. Permissions
are always setup in same order it means firs is always `r`, second is `w` and last one is `x`.
When permission is not setup there is slash `-` instead of one of permission `rwx`.
* next three char `r-x` is absolutely same as for `user` above but this set of chars
is meant to `group` or `g` adn we can see that for `group` kind of users theres is no any
write permissions allowed.
* last three chars are permissions for `other` or `o`

* `user` or `u` what can do the user
* `group` or `g` what can do the users of same group
* `other` or `o` what can do the anybody else


If we want to change permission we have to use command `chmod`.

Example we want to add `read` and `executable` permission to file with name `hello.sh` and just
for `user`

```shell
chmod u+rx hello.sh
```

We can also delete permissions if we want for example for `other`. We remove
`read` and `write` permission.

```shell
chmod o-rw hello.sh
```

As you can mention when we want to add permission we use mark `+`, otherwise
when we want to remove we use mark `-`.

schema is:

`chmod who(u, g, o) add/remove(+, -) permissions(r, w, x) filename`



# Shebangs

Shebang is used when we want to make some script executable.
Shebang has to be write at the beginning of the file.

Shebangs are described nicely on wiki [wiki shebangs](https://en.wikipedia.org/wiki/Shebang_(Unix)).

Generally shebang schema looks like:

```shell
#!interpreter [optional-arg]
```

you have to specified path to intepreter which will run the script. So you dont have to
write to CLI because you will tell to cli at the beginnig of the file.

Sometimes shell will evaluate automatically for example for bash, zsh, etc. scripts.

At the end of day you wont be write `python3 filename.py` but only `./filename`
for shebang `#!/usr/bin/env python3`

# Arguments from CLI

If you want to take some arguments from CLI, these arguments are saved in
variables $0, $1, $2

* $0 - scriptname
* $1 - first argument
* $2 - second argument
* $n - n-argument

you can specify that first argument is required as:

```bash
if [ ! "$1" ]
then
    echo "Missing first argument\n"
    echo "Usage: ./script.sh 'first argument'\n"
    exit 1
fi

echo "Your argument is: $1"
```


# Make your script for automation

If you use very often some same commands in CLI you can write these commands
to file as shell script for example some script.sh.

So you will save time to write all commands repetitive again and again. and you just
run script shell for one time.

To correctly run your script you have to set up `shebang` and give `execute` permissions
to that file.

the script should be somethin like this

`script.sh`

```bash
#!/bin/sh

if [ ! "$1" ]
then
    echo "Missing commit message\n"
    echo "Usage: ./generate_content.sh 'commit message to github'\n"
    exit 1
fi

sudo apt update && sudo apt upgrade
git add .
git commit $1
git push origin master

echo "scrript completed"
```


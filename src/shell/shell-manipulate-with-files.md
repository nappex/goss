---
title: How to truncate content of file in command line
date: 2024-07-08
updated: 2024-07-17
category: unix, shell
tags: unix, shell
summary: How to truncate content of file in command line (shell)
---



## Clear content of existing file without removing itself

```sh
$ truncate -s 0 path/to/file
```

```sh
$ echo "" >path/to/file
```

Command above can be simplified, because there is a special syntax for truncate the file.

```sh
$ >path/to/file
```
When I've tested on `zsh`, `bash`, `oksh`, `ksh`, `dash`. Only `zsh` not worked.

There is more portable command which was working also in `zsh`.

```sh
$ :>path/to/file
```


### Resources
- [Superuser.com - How to clear file content](https://superuser.com/questions/90008/how-to-clear-the-contents-of-a-file-from-the-command-line)
- [commandlinefu.com](https://www.commandlinefu.com/commands/view/12/empty-a-file)
- [Advanced bash scripting - I/O redirection](https://tldp.org/LDP/abs/html/io-redirection.html)


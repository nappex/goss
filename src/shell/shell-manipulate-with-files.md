---
title: How manipulate with files in shell
date: 2024-07-08
category: unix, shell
tags: unix, shell
summary: How manipulate with files in shell
---



## Clear content of existing file without removing itself

```sh
$ truncate -s 0 path/to/file
```

```sh
$ echo "" >path/to/file
```


# Generator of Static sites

Try to be simple shell static site generator. The inspiration is by project [ssg](https://romanzolotarev.com/bin/ssg) from Roman Zolotarev. Thanks for the inspiration.

# Dependecies

[lowdown](https://kristaps.bsd.lv/lowdown/)

## macOS

```shell
$ brew install lowdown
```

# Post date/time of modification

Script used modification time for file itself generated by OS.

```sh
# Formatted modified time

# for Linux:
$ MTIME="-c %y"

# for UNIX:
$ MTIME="-f %Sm -t %Y-%m-%d"
```

There are two commands because Linux uses `coreutils` `stat` and BSDes uses BSD `stat`. There is no `POSIX` solution or I have not found any at least.

But this approach is confusing, because the
modification date of file in perspective of OS is any change. The change which does not affect the content of the post or fix typo in one char. Then the the OS modification time of file is changed. This type of changes are not important for the readers. Relevant change for readers is ONLY updating of the post content. Unfortunately I do not think that there is a tool which is able to decide if the change is valuable change of the content for readers. I suppposed it always has to be decided by the author of the post.

So all list in blog generated by modification time had no extra value for readers. This is the reason why I decide that the `modification_date` has to be defined manually in every blog post. The `updated` is maybe more precise.

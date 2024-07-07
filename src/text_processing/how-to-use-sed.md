date: 2023-10-25
updated: 2024-07-01
title: How to use sed command

## How write changes from sed to file

<p class="warning">READ THIS CHAPTER FIRST</p>

If you want to apply deletion changes to file you have to use option `-i`
or redirect output with shell syntax `>`.

If you do not add one of above options, then the result will be printed to `stdin` instead to a file resp. a new file.

If you are not sure what the output will be, then do not use option `-i` it can removed yo u whole file. Instead use `>` or without any option to print just to stdin to test your
intentions.

The option `-i` will overwrite existing file which has been used as a source.
The option means `in place`. If you're using BSD (macOS included) sed, then you have
to use this syntax:

```sh
$ sed -i ''
```

or

```sh
$ sed -i ""
```

If you are using GNU sed then syntax below is enough

```sh
$ sed -i
```

Redirecting output with `>` will create you wholly new file and the source file will be un touched.

```sh
$ sed [sed_pattern] [src_filepath] > [new_filepath]
```

All examples below are write for macOS.

## Delete all empty lines

```sh
$ sed -i "" '/^$/d' file.txt
```

`^` - start of line
`$` - end of line

Delete lines which contains only `START` and `END`.

## Delete one line specified by line number

```sh
$ sed -i "" '[line_number]d' [file_path]
```

```sh
$ sed -i "" '7d' file.txt
```

Or you can delete several lines one by one

```sh
$ sed -i "" '[line_number]d;[line_number]d' [file_path]
```

```sh
$ sed -i "" '7d;12d;16d' file.txt
```

## Delete last line

`$` is symbol wich represent last line.

```sh
$ sed '$d' input.txt
```

## Delete range of lines specified by lines number

```sh
$ sed -i "" '[start_line_number],[end_line_number]d' [file_path]
```

Delete lines from line number 3 to line number 9.

```sh
$ sed -i "" '3,9d' file.txt
```

## Delete several ranges of lines

```sh
$ sed -i "" '[first_range]; [nth_range]d' [file_path]
```

Delete lines specified in two ranges. Delete lines 1 to 3(included) and lines from 7 to 9.

```sh
$ sed -i "" '1,3d; 7,9d' input.txt
```

Delete from 1 to 3 and from 7 to the end of file.

```sh
$ sed -i "" '1,3d; 7,$d' input.txt
```

## Delete all lines which match pattern

```sh
$ sed -i "" '/[pattern]/d' [file_path]
```

Delete all lines which contains "hello"

```sh
$ sed -i "" '/hello/d' file.txt
```

If you want to ingorecase of pattern

```sh
$ sed -i "" '/hello/I d' file.txt
```

## Delete all lines which not matching pattern

```sh
$ sed -i "" '/[pattern]/!d' [file_path]
```

Delete all lines which not contains "hello"

```sh
$ sed -i "" '/hello/!d' file.txt
```

## Delete range of lines specified by pattern

Delete all lines between lines which `START` line contains `start_pattern` and `END` line
contains `end_pattern`. Lines with `patterns` are included in deletion.

```sh
$ sed -i "" '/[start_pattern]/,/[end_pattern]/d' [file_path]
```

Delete all lines between lines where start line contains 'Hello' and end line
contains 'Thanks', including start and end lines.

```sh
$ sed -i "" '/Hello/, /Thanks/d' file.txt
```

## Insert a new line with text after match

It is important if you are using `GNU` sed or the `POSIX` sed (BSD, macOS).
For both is little bit different syntax.
[See stackoverflow](https://stackoverflow.com/a/25306308)

**`POSIX` sed solution, append (write after) all match**

```sh
$ sed -i '' $'/regex_to_match/a\\\nline_to_append_after_match\\\n' filepath

# example
$ sed -i "" '/<h1>/a\\\n<p>My new article about cats\\\n' www/posts/cats.html
```

Or it can be used with dollar sign `$` with a newline to use less backward slashes `\`.

```sh
$ sed -i "" '/regex_to_match/ a\'$'\n'"$variable"$'\n' filepath

# example
$ sed -i "" '/<h1>/ a\'$'\n'"$publish_date"$'\n' www/posts/cats.html
```
- `\a` append new line after all match

**Solutions above append a newline to all matches.**


Honestly, I like the solution with `ed` instead of `sed`. Solution for `ed` is more intuitive for me.

**`POSIX` `ed` editor solution, write a newline just after a first match**

```sh
$ printf "/<h1>/a\nHello World!\n.\nw\nq\n" | ed filepath >/dev/null

# with variable
$ printf "/<h1>/a\n$variable\n.\nw\nq\n" | ed filepath >/dev/null
```

**`Here-string` ed solution (not POSIX)**

With herestring ANSI-C string has to be used because of `\n`

```sh
$ ed filepath <<<$'/<h1>/a\nHello World!\n.\nw\nq\n' >/dev/null

# with variable
# every escaped character has to be add to ANSI-C Quoting
# to expand variable in string
$ ed a <<<"/<h1>/a"$'\n'"$variable"$'\n'"."$'\n'"w"$'\n'"q"$'\n' >/dev/null

# above can be simplified
# split ANSI-C string by double quotes for variable
$ ed a <<<$'/<h1>/a\n'"$variable"$'\n.\nw\nq\n' >/dev/null
```

- `/<h1>` search h1 tag
- `/a\n` switch to insert mode after search match (`a` is command insert after, `i` is command insert before)
- `$variable\n` insert string stored in variable with newline
- `.\n` switch from insert mode to command mode or prompt
- `w\n` write changes from buffer to file
- `q\n` quit the **ed** editor

`a, ., w, q` are commands for ed editor and have to be ended with newline.
When you are manipulate file with ed prompt manually, you push after
each command <Enter> (or carriage-return).

**Solutions with `ed` editor will append a newline only after first match.**

## Replace/Substitute only first occurency of match

This task can be done relatively easily with `GNU` sed, but if you want to solve in complaince
with `POSIX`, then `GNU` sed solutio will not work. `POSIX` solution for BSD or macOS is little harder.
The whole problem is described on [stackoverflow](https://stackoverflow.com/a/33416489).
Most of my description is taken from stackoverflow just for archive reasons.
Other reason why I duplicate the text from stackoverflow is that the solution for `GNU` sed
is full of internet, but it is hard to find the `POSIX` solution. And YES the `POSIX`
solution works for `GNU` sed.


*Notes for solutions:*

- `sed` provides a convenient **shortcut** for reusing the **most recently applied regular expression**: an empty delimiter pair `//`.

- dollar sign (`$`) before the quoted string sending to sed command is [ANSI C-quoted strings ($'...')](http://www.gnu.org/software/bash/manual/bash.html#ANSI_002dC-Quoting), this kind of string gives to escaped characters special meanings. For e.g. `\n` will become a newline.



1. **`GNU` sed solution:**
`GNU` provide some extentsions to `POSIX` sed. Hence the solution is different, because
of that extension.

```sh
$ sed '0,/foo/ s//bar/' <<<$'1st foo\nUnrelated\n2nd foo\n3rd foo'
```

*Description of `GNU` sed command (just copied from stackoverflow, authors are [mklement0](https://stackoverflow.com/users/45375/mklement0) and [holdoffhunger](https://stackoverflow.com/users/2430549/holdoffhunger))*

`GNU` sed allows 2-address form: `0,/re/` (`re` represents an arbitrary regular expression here).
`0,/re/` allows to match the regex on the first line also. In other words: such an address will create a range from the 1st line up to and including the line that matches `re` - whether `re` occurs on the 1st line or on any subsequent line.

Contrast this with the POSIX-compliant form `1,/re/`, which creates a range that matches from the first line up to and including the line that matches `re` on subsequent lines; in other words: this **will not** detect the **first occurrence** of an `re` match if it happens to occur on the **first line** and also prevents the use of shorthand `//` for reuse of the most recently used regex (see `POSIX` solution below).

If you combine a `0,/re/` address with an `s/.../.../` (substitution) call that uses the same regular expression, your command will effectively only perform the substitution on the first line that matches `re`.

2. **`POSIX` sed solution with "range" (BSD, macOS):**

Since `0,/re/` cannot be used and the form `1,/re/` will not detect `re` if it happens to occur on the first line (see above `GNU` solution),
special handling for the first line is required in `POSXI` solution.

```sh
$ sed -e '1 s/foo/bar/; t' -e '1,// s//bar/' <<<$'1st foo\nUnrelated\n2nd foo\n3rd foo'
1st bar         # only 1st match of 'foo' replaced
Unrelated
2nd foo
3rd foo
```

```sh
$ sed -e '1 s/foo/bar/; t' -e '1,// s//bar/' <<<$'1st boo\nUnrelated\n2nd foo\n3rd foo'
1st boo
Unrelated
2nd bar         # only 1st match of 'foo' replaced
3rd foo
```

*Description of command (just copied from stackoverflow, authors are [mklement0](https://stackoverflow.com/users/45375/mklement0) and [holdoffhunger](https://stackoverflow.com/users/2430549/holdoffhunger))*

The empty regex `//` shortcut is employed twice here:
    - first for the endpoint of the range
    - second in the `s` command call;
in both cases, **regex foo** is implicitly **reused**, allowing us no duplications which makes shorter and more maintainable code.

`POSIX sed` needs actual **newlines** after certain functions, such as after the **name** of a label or even its omission, as is the case with `t` here;
Splitting the command to multiple `-e` options is an alternative to use a **newlines**: end each `-e` chunk where a **newline** would normally need to go.

`1 s/foo/bar/` replaces `foo` on the first line **only**, if found there.
If so, `t` branches to the end of the script (skips remaining commands on the line).
(The `t` function branches to a label only if the most recent `s` call performed an actual substitution; in the absence of a label, as is in the first case above, the end of the script is branched to).

When that happens, range address `1,//`, which normally finds the first occurrence starting from line **2**, will not match, and the range will not be processed, because the address is evaluated when the current line is already **2**.

Conversely, if there's no match on the first line, `1,//` will be entered, and will find the true first match.

The net effect is the same as with `GNU` sed's `0,/re/`: only the first occurrence is replaced, whether it occurs on the first line or any other.




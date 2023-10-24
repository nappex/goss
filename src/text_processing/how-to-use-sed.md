Date: 2023-10-25
Title: How to use sed command

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


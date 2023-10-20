---
Title: Use your command line more effectively
Date: 2022-03-10
Category: Linux, Shell, unix
Tags: linux, beginner, unix
Slug: command-line-moves
Authors: David S
Summary: How to control your command line with shortcuts
Status: published
---

[TOC]

# Introduction
If you want to operate your computer as master, then necessary skill is to control your `command line`. Each of beginners have a strange feelings about `command line`. I undestand it. `Graphical` environment is for basic work more intuitive without any extra knowledge. At first view of somebody who has no experience with terminal it could seem as something more difficult for same result as we can do with `graphical` env. The half of that opinion is true, you need to learn some extra knowledge to use terminal and the learning path will be more difficult and longer than to learn how to use `graphical` env. But when you learn the terminal you will be faster, preciser, and more powerful user of your computer because you get option to setup whatever you want. The `graphical` environment is just layer around commands in terminal with buttons and fancy windows. If you setup something in `graphical` env and click to button `apply` or `OK`, then some command is sent to computer and the command will be somthing in shell on background. And there you can see limitation of `graphical` environment. You can not have buttons to all setup, all commands, or the all combinations of commands. Then the `graphical` environment will lost their simplicity and intuitive. So if you don't want to use your computer more deep and you wanna just browsing the internet than `graphical` environment is absolutely ok without touch the terminal tool.

Also it is not necessary to use just only graphical env or command line. The best usage is combination of both. Each of approach has some advantages and disadvantages. Some guys who are really master in command line using just command line but it is really hard way for people who really know what they are doing. Or lots of admins of servers are using just command line, because it is simple and fast way how to operate servers remote by ssh for example. Some other guys really enjoy combination fo command line and `tilling window managers` for example
[dwm](https://dwm.suckless.org/) or [i3wm](https://i3wm.org/).

# Useful shortcuts to control you command line

## Explanation
**CTRL** means CONTROL button. Button is located near to `alt` buttons in keyboard layout.
**ALT** means OPTION button.
**CMD** means COMMAND or ACTION button. Windows: button with window. MacOS: cmd.

Uppercases letters don't mean to use with `SHIFT` button. Uppercase is used because letters are in keyboard are print as uppercase. If `SHIFT` should be used, then its name will be mentioned in combination.

Shorcuts are mentioned for operation system `Linux`. Some of these shortcuts will not work on diff OS.

## Shortcuts

### Special cases

#### CTRL + V

**Keypressing:** gradually (one after another)

**Action:** enable mode where special button as arrows, control, alt lost its function and we will see chars which are sending to terminal when we pressed these special buttons in normal mode.


### Autocompletion

#### TAB

**Keypressing:** single press or twice press

**Action:**
* single press: autocomplete command from chars we've already written
* twice press: if autocomplete cannot autocomplete command because there are to many options of suitable command, then we can press `TAB` twice and shell list all available options.

It is a helpful habit to use `TAB` button, it helps to avoid typos.

#### ESC + .

**Keypressing:** gradually (one after another)

**Action:** autocomplete last used argument

**examples:**
```shell
$ mkdir "Hello world"
$ ls '(press ESC + .)'
```

you should get:

```shell
$ ls "Hello world"
```

### Interruptions

#### CTRL + C

**Keypressing:** gradually (one after another)

**Action:** interrupt running command, process in your terminal. This shorcut will invoked `exception`, in python it is called as `KeyboardInterrupt`. It is really helpful way how to interrupt for example infinite cycle.

### Control STDIN to terminal

#### CTRL + S

**Keypressing:** gradually (one after another)

**Action:** stop `stdin` of running command. All outputs from file descriptor to terminal are stopped.

#### CTRL + Q

**Keypressing:** gradually (one after another)

**Action:** start `stdin` of running command. All outputs from file descriptor to terminal are started again.

### Browsing command history

#### ⇧ UP-ARROW or (CTRL + P)

**Keypressing:** gradually (one after another)

**Action:** autocomplete with previous command. To your relative position in commands history.

#### ⇩ DOWN-ARROW or (CTRL + N)

**Keypressing:** gradually (one after another)

**Action:** autocomplete with next command. To your relative position in commands history.

#### CTRL + R (CTRL + R "pattern")

**Keypressing:** gradually (one after another)

**Action:** search in commands history. When you pressed these buttons combinations, then search mode is activated. You have to write some pattern which you want to looking for. Search mode find the youngest command as first result which contains your pattern. If you want find older command you have to pressed `CTRL+R` again and you will move to older and older commands which sit to your pattern. If you want to quit the search mode with run the command hit `Enter`. If you want to leave search mode with any action double press `ESC`.

### Moving cursor on line

#### CTRL + A or (HOME)

**Keypressing:** gradually (one after another)

**Action:** move cursor at the start of line

#### CTRL + E or (END)

**Keypressing:** gradually (one after another)

**Action:** move cursor at the **e**nd of line

#### CTRL + ⇦ or (ALT + B)

**Keypressing:** gradually (one after another)

**Action:** move cursor to left. Cursor move is done word by word.

**macOS:** CMD + ⇦

#### CTRL + ⇨ or (ALT + F)

**Keypressing:** gradually (one after another)

**Action:** move cursor to right. Cursor move is done word by word.

**macOS:** CMD + ⇨

### Remove

#### CTRL + K

**Keypressing:** gradually (one after another)

**Action:** remove all chars from cursor to the end of line.

#### ESC + D

**Keypressing:** gradually (one after another)

**Action:** remove all chars from cursor to the end of word.

#### CTRL + W

**Keypressing:** gradually (one after another)

**Action:** remove all chars from cursor to the beginning of word.

#### CTRL + L

**Keypressing:** gradually (one after another)

**Action:** remove all lines in terminal except the active one. Clear the terminal window from old commands.

#### CTRL + U

**Keypressing:** gradually (one after another)

**Action:** remove whole line

## Where to find all shortcuts

If some of shortcuts does not work, there is settings in shell config file. Name of config file is `.inputrc` and it is located in your home directory.

You can set your `.inputrc` on your own:

`.inputrc`
```
set blink-matching-paren on # blink to parenthes which is paired with
set expand-tilde on # expand tilda to absolute path when you press TAB

"\C-t": forward-search-history # keyboard shortcut CTRL+T
```

You can list all shortcuts to your shell by command:
```shell
$ bind -p | less
```
* `\C` means `CONTROL` button. So `"\C-r"` means `CTRL + R` in our convention.
* `\e` means `escape`


# Useful links
* Whole article was written thanks to online lecture of Lukas Barinka.
Thanks Lukas for great [youtube-video](https://www.youtube.com/watch?v=SWJj1hGgA8g&list=PLHS-Uhp7t2Ys5lwy-5jops3t_DCfpXu_j&index=8) and your whole course about command line. Video is in czech language.

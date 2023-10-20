---
Title: Python project structure
Date: 2020-11-02
Modified: 2020-11-23
Category: Python
Tags: python, beginners
Slug: python-scheme
Authors: David
Summary: How looks like a basic structure of most python project
Status: published
---


[TOC]

# Intro

There is no way how to make scheme of python project universal or general. Python let you done your project how do you want and there are no restrictions.
But there are some common files or directories which you can notice in almost every project. These cases are described below.

# Files

## README

- README
- README.txt
- README.rst
- README.md

### Jak má vypadat README

1. název projektu,
2. stručný popis projektu (jedna až dvě věty),
3. krátký návod k instalaci projektu,
4. krátký návod ke spuštění projektu,
5. krátký návod k používání projektu, případně odkaz na rozsáhlejší dokumentaci,
6. pokud má projekt testy, informace o tom, jak je spustit,
7. informace o tom, jak se zapojit do vývoje projektu,
8. informace o autorech projektu,
9. informace o licenci (více se licencích dozvíš později).

Více info na: [naucse.python.cz/2020/brno-jaro-pondeli/git/collaboration/](naucse.python.cz/2020/brno-jaro-pondeli/git/collaboration/)

## LICENSE

## setup

- setup.py
- setup.cfg

## script

## modules

## tox.ini

## requirements.txt

- test_requirements.txt
- dev_requirements.txt
- requirements-dev.txt

## .gitignore

## .travis.yml

## .python-version

This file we can see in project which using tool [pyenv](https://github.com/pyenv).
This library handle python versions in PC, virtual environments etc.
With that file pyenv recognize which python version or which virtual
environment is set for this project.

## Makefile

# Directories
## docs

## tests

## .github
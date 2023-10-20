---
Title: Konverze Jupyter notebooku do dalších formátů
Date: 2020-9-2
Category: Jupyter
Tags: python, beginners
Slug: jupyter-convertion
Authors: David
Summary: How to convert jupyter notebook .ipynb file to html, slideshow, etc.
Status: published
---

[TOC]

# 1. Vytvoření prezentace (slideshow) ze souboru .ipynb

Pokud si uděláte analýzu dat a potřebujete z ní potom udělat nějakou pěknou prezentaci třeba pro šéfa, tak jupyter notebook má své řešení. Což je super jelikož nemusíte řešit další appku či software. Celé je to celkem super easy. Jupyter notebook vytváří prezentace ve formátu **html**. Mě se toto řešení osobně velice líbí, protože takovou prezentaci spustíte dnes na každém počítači a není rozházená. Navíc se velmi intuitivně ovládá pomocí šipek. Abyste mohli vytvořit prezentaci tak musíte postupovat následovně.

Musíte mít nainstalován v pythonu jupyter notebook. Poté stačí do příkazové řadky napsat:

    $ python3 -m jupyter nbconvert <path_to/your_file.ipynb> --to slides

pořádí nemá vliv
    $ python3 -m jupyter nbconvert --to slides <path_to/your_file.ipynb>

Výstupem tohoto řádku je soubor `your_file.slides.html`, který se uloží do složky, v které je uložen zdrojový soubor určený ke konverzi tedy např. `/folder1/folder2/your_file.ipynb`. Tento soubor je vaše nová hotová prezentace.

A co jednotlivé části kódu znamenají ?

`python3` - budeme pracovat s pythonem3

`-m` - načti pythonní modul. Nebo budeme používat modul z python3

`jupyter` - modul z pythonu3, který budeme používat má název jupyter

`nbconvert` - z modulu jupyter použij nástroj nbconvert, který se stará o konvertování do jiných formátů

`--to` - je jeden z aliases nástroje nbconvert, který říká *do* jakého formátu chceme náš soubor konvertovat

`slides` - jeden z možných výstupních formátů. `slides` nám vytvoří formát .slides.html, ale můžeme místo slides napsat třeba jen html a dostaneme čisté hmtl.

`<path_to/your_file.ipynb>` - cesta k souboru, který byl vytvořen pomocí jupyter notebooku a chceme z něj udělat prezentaci či jiný formát

# 2. Vytvoření prezentace bez python nebo jiného programovacího kódu

Je to stejné jako v předchozím případě, jediné v čem se to liší je použití navíc tzv flags.
Kód do příkazové řádky:

    $ python3 -m jupyter nbconvert your_analyze.ipynb --to slides --no-input

Oproti předchozímu příkladu přibyl jeden flag navíc a to `--no-input`. Který zajistí, že se v prezentaci nebude objevovat kód neboli buňky které nejsou typu markdown. Pro tento účel lze ještě použít flag `--no-prompt`, ale ten nemám zcela ošahaný. Jaké existují flags and aliases pro nbconvert naleznete v dokumentaci, kterou uvádím v užitečných odkazech.

# 3. Vytvoření html ze souboru .ipynb

Jak bylo zmíněno v [kapitole 1](#1.-Vytvoření-prezentace-(slideshow)-ze souboru-.ipynb) změna výstupního formátu je pouze o tom, jaký formát nastavíme pro alias `--to`.

Kód by vypadal takto:

    $ python3 -m jupyter nbconvert --to html <path_to/your_file.ipynb>

# Použité zdroje - další studium

* [Flags and aliases - nbconvert](nbconvert.readthedocs.io/en/latest/config_options.html#cli-flags-and-aliases)

* [Medium article about presentation](medium.com/@mjspeck/presenting-code-using-jupyter-notebook-slides-a8a3c3b59d67)
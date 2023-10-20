---
Title: Cvičení k programování
Date: 2020-9-3
Category: Exercises
Tags: exercises, beginners, scrapy
Slug: exercises
Authors: David
Summary: Examples of exercises which you can do in furture work
Status: published
---

[TOC]

# 1. Zadání pro web scraping

1. Napište scraper pro stahování dat nejnovějších článků z online serverů. Scraper bude vycházet ze stránky seznamu nejnovějších článků a postupně se "proklikávat" do detailu jednotlivých článků, případně seznamu komentářů.

2. Ze stažených článků se pokuste vyextrahovat maximum dostupných relevantních informací (nadpis, datum zveřejnění, autor, vlastní text, komentáře, počet zhlédnutí, ...) a uložíte do NoSQL databáze.

3. Nad uloženými daty napište jednoduché API (např. flask), které dokáže vracet (vyberte si alespoň 2):

    * N nejnovějších článků
    * N nejkomentovanějších článků
    + N nejpoužívanějších slov
    + N nejdelších slov

**Technologie:**

* Povinné
    + Python 3.x
    * knihovna [Scrapy](https://scrapy.org/)
    * NoSQL databáze [MongoDB](https://www.mongodb.com/)
    * knihovna [Flask](https://flask.palletsprojects.com/en/1.1.x/)


* Doporučené
    - Docker
    - Pytest
    - cokoliv :)


* Level Python Guru
    - Jupyter
    - Pandas
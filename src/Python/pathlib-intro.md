---
Title: Python knihovny pro práci se soubory
Date: 2020-9-2
Category: Python
Tags: python, beginners
Slug: files-introduction
Authors: David
Summary: How to handle paths and files with python
Status: published
---

[TOC]

# 1. Knihovna pathlib

Jedná se o knihovnu, která je od pythonu 3.4 built-in a není tedy potřeba ji doinstalovávat.

Základní použití knihovny vypadá následovně

```
    import pathlib

    pathlib.Path("folder1/folder2/run.exe")

    Output: PosixPath('folder1/folder2/run.exe')
```


Výše je základní příkaz třídy Path pomocí které se vytváří cesta - objekt cesty. Výstupem tohoto příkazu je `PosixPath("cesta")`

Základem používání této knihovyn je vytvoření objektu ze stringu pomocí příkazu `pathlib.Path('vase/cesta/nekam')`. Po vytvoření objektu `PosixPath` si můžete s touto cestou hrát dle své libosti pomocí široké škály method a atributů, které tento objekt na danou cestu poskytuje.

Třída Path se dá použít i bez toho, aniž bychom museli zadat cestu. Třída disponuje metodami jako například `cwd()` - vypíše current working directory nebo `home()` - který vypíše absolutní cestu k vaší domovské složce.

Z dokumentace můžete být trochu zmatení z těchto dvou příkazů `pathlib.Path()` vs `pathlib.PurePath()` na první pohled totiž není mezi nimi většího rozdílu. Nicméně po detailním prostudování dokumentace [Pathlib dokumentace](https://docs.python.org/3/library/pathlib.html) zjistíme tyto rozdíly:

1. Každý dělá jiný typ objektu - `Path()` vytvoří objekt `PosixPath` kdežto `PurePath` vytvoří `PurePosixPath`.
2. `Path()` disponuje navíc dalšími metodami, kterými si může šáhnout do souborů na počítači. `PurePosixPath` naopak nemá přístup do systému.

## Spojování cest

Vytvářet či spojovat cesty můžeme několika způsoby:

`from pathlib import Path`

1. `p = Path('/home/george/Documents/hello.txt)`
2. `p = Path('/', 'home', 'george', 'Documents', 'hello.txt')`
3. `p = Path('/home') / 'george' / Path('Documents', 'hello.txt')`
4. `p = Path('/home').joinpath('george', 'Documents', 'hello.txt')`


---

`pathlib.Path.cwd()`

Zjistí v našem systému current working directory. Tedy složku v které se právě nacházíme.

    pathlib.Path.cwd()

    Output: PosixPath('/Users/your_name/Documents/Python')

---

`pathlib.Path.home()`

Vypíše domovskou adresu našeho účtu v operačním systému. Na linuxu by mohla výstupní cesta vypadat jako /home/user_1/

    pathlib.Path.home()

    Output: PosixPath('/Users/your_name')

---

`pathlib.Path("relativni_cesta").resolve()`

Tato metoda nám vytvoří z relativní cesty cestu absolutní. Ovšem pozor, pokud zadáte cestu, která obsahuje lomítko na začátku cesty, tak tento zápis cesty znamená, že zadávate už absolutní cestu.

**Cesta s lomítkem**

    pathlib.Path('/files_introduction/index.ipynb').resolve()

    Output: PosixPath('/files_introduction/index.ipynb')

**Cesta bez lomítka**

    pathlib.Path("files_introduction/index.ipynb").resolve()

    Output: PosixPath('/Users/your_name/Documents/files_introduction/index.ipynb')

## 1. Otevírání souborů

Klasické otevírání souborů vypadá nějak takto:

`with open(path, mode="r", encoding="UTF-8") as file_:`

S knihovnou pathlib lze soubory otevírat velmi podobným způsobem:

`with pathlib.Path("cesta").open(mode="r", encoding="UTF-8") as file_:`

nebo také to samé rozepsáno:

`path = pathlib.Path("cesta")`

`with path.open(mode="r", encoding="UTF-8") as file_:`

Tímto způsobem je spuštěno open() stejně jako v prvním přikladě, ovšem zápis může být pro někoho příjemnější nebo intuitivnější. V zásadě se ale jedná o totéž.

Pomocí třídy Path můžete pro zápis nebo čtení souborů, otevírání souborů rovnou přeskočit pomocí method - **read_text()**, **read_bytes()**, **write_text()**, **write_bytes()**<br>

`pathlib.Path("cesta").read_text()`

# 2. Knihovna os.path

Knihovna os nám pomáhá při práci s počítačem všeobecně. Konkrétně os.path je určena pro práci s cestami. Knihovna je velmi podobná knihovně pathlib, s tím rozdílem, že pathlib je o něco intuitivnější a jeho metody a atribute se mohou svými nazvy lišit. Nicméně pro základní používání najdete obou v knihovnách metody se stejnou funkcí. Tabulku, kde uvidíte, které metody jsou pro obě stejné naleznete v [dokumentaci pathlib - corresponding to os module](https://docs.python.org/3/library/pathlib.html#correspondence-to-tools-in-the-os-module) úplně na konci.

# 3. fnmatch

Pomocí tohoto modulu vytváříme patterny, dle kterých hledáme soubory či adresáře.

Nejedná se o regexy to je úplně něco jiného

[fnmatch](https://docs.python.org/3/library/fnmatch.html)

# 4. glob

Metoda glob se používá pro vyhledávání souborů, se specifickým názvem (např. vyhledej v adresáři všechny soubory s příponou .txt), tento název konfigurujeme pomocí [fnmatch](https://docs.python.org/3/library/fnmatch.html)

viz. [dokumentaci pathlib - glob](https://docs.python.org/3/library/pathlib.html#pathlib.Path.glob)

nebo v [naucse.cz](https://naucse.python.cz/2020/pyladies-ostrava-podzim-pokrocili/intro/pathlib/)

# Použité zdroje - další studium

* Portál naučse:

[naucse.python.cz/2019/brno-jaro-2019-pondeli/intro/pathlib/](https://naucse.python.cz/2019/brno-jaro-2019-pondeli/intro/pathlib/)

* RealPython:

[realpython.com/python-pathlib/](https://realpython.com/python-pathlib/)


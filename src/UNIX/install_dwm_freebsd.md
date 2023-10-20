---
Title: Instalace suckless dwm na FreeBSD
Date: 2022-06-01
Category: dwm, unix, freebsd
Tags: advanced, freebsd, unix
Slug: install-dwm-to-freebsd
Authors: David
Summary: Jak nainstalovat window manager dwm suckless na FreeBSD
Status: published
---

[TOC]

# Úvod

Tento článek je stále pod vývojem. Ne všechny body jsou mi zcela jasné.
Nicméně, už nyní zde najdete postup, který je možno úspěšně použít a bude
vše fungovat.

Později bych rád doplnil i instalaci přes porty, ale nemám je ještě dostatečně
zvládnuty a pro začátek si vystačíme s instalalcí předkompilovaných balíčků.
Pokročilejší zvládnou instalaci pomocí portů i bez tohoto návodu.

Anglická verze [zde]() nebo na konci článku.
English version [here]() or at bottom of this article.

# Příprava

## Instalace git

Program `git` budeme potřebovat abychom byli schopni
stáhnout zdrojové kódu projektu dwm pomocí příkazu `git clone`.
Zdrojové kódy lze stáhnout i jako `.tar` soubory, ovšem při různých změnách
konfiguračních souborů se tyto změny lépe spravují pomocí `git` hned od začátku.
To je čistě můj laický názor, který se může v budoucnu změnit.

```sh
$ sudo pkg install git
```

## Instalace xorg

Program `xorg` je open source X Window System, který poskytuje
grafické prostředí pro uživatele. Funguje na komunikaci
mezi XServer a XClient, kde XClient posílá požadavky typu, potřebuji
vykreslit takové okno apod. `Xorg` neurčuje, jak co má vypadat, umístění
jednotlivých prvků jako tlačítka nebo způsob pohybu jendotlivých oken.
Tohle celé nechává na window managerech, jako je např. dwm
nebo na robustnějších desktop prostředích jako je GNOME nebo KDE.
Desktop prostředí už obsahuje i celé sady aplikací,
které jsou vytvořené přímo na dané prostředí.
U malých sítí nebo jednotlivých počítačích je většinou Xserver a XClient
na jednom počítači.

Níže uvedený příkaz nainstaluje i věci, které nejsou pro `dwm` nutné.
Bohužel v tuto chvíli nejsem schopen s jistotou
říct, které balíčky jsou nutné a které nikoliv. Daní za instalaci celého
`xorg` v tomto návodu je, že budete
mít nějaké balíčky navíc, což není hrůza, ale do budoucna
je dobré mít věci pod kontrolou a chci tuto část přepracovat, aby byla přesná.

```sh
$ sudo pkg install xorg
```

Instalace `xorg` je součástí oficiální
[Handbook pro FreeBSD](https://docs.freebsd.org/en/books/handbook/x11/),
kde naleznete další uvedené kroky.

Pokud `xorg` instalujete na počítač, kde historicky už `xorg` instalován
byl, je lepší resetovat konfigurační soubory
v domovském adresáři daného uživatele.

```sh
$ mv /etc/X11/xorg.conf ~/xorg.conf.etc
$ mv /usr/local/etc/X11/xorg.conf ~/xorg.conf.localetc
```

Dále je dobré přidat uživatale do skupiny `wheel` nebo `video`
kvůli 3D akceleraci.

```sh
$ pw groupmod video -m jru || pw groupmod wheel -m jru
```

V tuto chvíli si můžete zapnout defaultní window manager `TWM`,
který byl nainstalován také, pomocí příkazu:

```sh
$ startx
```
 Pokud chcete `TWM` window manager vypnout napište do terminálu `exit`


 ### Nastavení xorg

Tato kapitola se dodělává.

## Instalace závislostí pro dwm

NEODZKOUŠENO

```sh
$ pkg install git xorg-server xorg-fonts-truetype gcr devel/glib20 \
xorg-fonts-type1 p5-X11-Xlib p5-PkgConfig xauth xrandr xinit libXft xrdb webkit2-gtk3 \
feh xf86-input-mouse xf86-input-keyboard linux-c7-libpng
```

# Instalace suckless tools - dwm, dmenu, st

Podobný článek jako je tento je například [zde](https://horodistea.wordpress.com/2020/02/06/compiling-suckless-tools-on-freebsd/)

Nejdříve si uděláme složku, kde jednotlivé budeme mít uloženy zdrojáky
jednotlivých nástrojů.

```sh
$ cd ~
$ mkdir .suckless_dwm
$ cd .suckless_dwm
```

Následně stáhneme všechny zdrojové kódy pomocí `git clone`

```sh
$ git clone https://git.suckless.org/dwm
$ git clone https://git.suckless.org/dmenu
$ git clone https://git.suckless.org/st
```

## Instalace dwm

K instalaci jsem použil [vlákno](https://forums.freebsd.org/threads/solved-setting-up-dwm-in-freebsd.81729/) z FreeBSD fóra.

Přesuneme se do složky se zdrojovým kódem `dwm`

```sh
$ cd ~/.suckless_dwm/dwm
```

Poté musíme upravit konfigurační soubour `~/.suckless_dwm/dwm/config.mk`

```sh
$ vim `~/.suckless_dwm/dwm/config.mk`
```

V souboru `config.mk` je nutno provést tyto změny:

```
X11INC = /usr/X11R6/include             ->  X11INC = /usr/local/include
X11LIB = /usr/X11R6/lib                 ->  X11LIB = /usr/local/lib
FREETYPEINC = /usr/include/freetype2    ->  FREETYPEINC = /usr/local/include/freetype2
```

Nakonec provedeme samotnou instalaci

```sh
$ cd ~/.suckless_dwm/dwm
$ make
$ sudo make clean install
```

Zde bych rád vysvětlit posloupnost jednotlivých příkazů, které nemusí
být začátečníkovi, který nemá zkušenost s kompilací hned zřejmé.
Vycházím z tohoto [vlákna na stackoverflow](https://stackoverflow.com/questions/10961439/why-always-configure-make-make-install-as-3-separate-steps).

První `make` je ve skutečnosti zkratka pro `make all` a udělá build systému,
který se může skládat z několika různých kroků, které si autor nastaví.
Většinou tento příkaz není potřeba dělat, protože projekty jsou většinou
vytvořeny tak, že fungují správně i když zadáte samotný příkaz `make install`.
Ale pro jistotu je vždy lepší udělat tento mezikrok.

`make clean install` - už přímo instaluje požadované věci do systému. `clean`
většinou odstraní soubory o kterých se ví, že nahradí při instalaci novými.


Posledním bodem je vytvoření souboru `.xinitrc`

```sh
$ echo "exec dwm" >> ~/.xinitrc
```

nebo celou cestu

```sh
$ echo "exec /usr/local/bin/dwm" >> ~/.xinitrc
```

Teď když zadáme příkaz `startx`, tak se nám už místo defaultního `TWM`
spustí `dwm`.

## Instalace dmenu

Instalace je skoro totožná jako v případě `dwm`.

Přesuneme se do složky se zdrojovým kódem `dmenu`

```sh
$ cd ~/.suckless_dwm/dmenu
```

Poté musíme upravit konfigurační soubour `~/.suckless_dwm/dmenu/config.mk`

```sh
$ vim `~/.suckless_dwm/dmenu/config.mk`
```

V souboru `config.mk` je nutno provést tyto změny:

```
X11INC = /usr/X11R6/include             ->  X11INC = /usr/local/include
X11LIB = /usr/X11R6/lib                 ->  X11LIB = /usr/local/lib
FREETYPEINC = /usr/include/freetype2    ->  FREETYPEINC = /usr/local/include/freetype2
```

Nakonec provedeme samotnou instalaci

```sh
$ cd ~/.suckless_dwm/dmenu
$ make
$ sudo make clean install
```

## Instalace st

Instalace je skoro totožná jako v případě `dwm` a `dmenu`.

Přesuneme se do složky se zdrojovým kódem `st`

```sh
$ cd ~/.suckless_dwm/st
```

Poté musíme upravit konfigurační soubour `~/.suckless_dwm/st/config.mk`

```sh
$ vim `~/.suckless_dwm/st/config.mk`
```

V souboru `config.mk` je nutno provést tyto změny:

```
X11INC = /usr/X11R6/include             ->  X11INC = /usr/local/include
X11LIB = /usr/X11R6/lib                 ->  X11LIB = /usr/local/lib

tímto řadkem si nejsem jistý
FREETYPEINC = /usr/include/freetype2    ->  FREETYPEINC = /usr/local/include/freetype2
```

Namísto `FREETYPEINC` zkus najít `PKG_CONFIG`
a jeho hodnotu změň na:

```
PKG_CONFIG=/usr/local/bin/pkg-config
```

Nakonec provedeme samotnou instalaci

```sh
$ cd ~/.suckless_dwm/dmenu
$ make
$ sudo make clean install
```

Zde byste měli dostat chybu něco jako:

```sh
tic -sx st.info

Error: exec(tic) file not found
```

Tímto problémem se zabývá toto [vlákno](https://forums.freebsd.org/threads/st-terminal-convert-terminfo-to-termcap.75326/), které jsem v zásadě použil
i pro vyřešení tohoto problému.

Musíme nainstalovat `ncurses`, čímž získáme `tic`.

```sh
$ sudo pkg install ncurses
```

Instalace by měla automaticky nalézt i závislost `term-db`

Po těchto krocích už instalace projde bez errorů. Nicméně je nutné ji
ještě prozkoumat a zanalyzovat.


# Jak používat dwm

* https://dwm.suckless.org/tutorial/
* https://srobb.net/dwm.html

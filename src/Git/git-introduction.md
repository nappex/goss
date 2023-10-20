---
Title: Git - introduction to basic commands
Date: 2020-8-26
modified: 2020-11-4
Category: Git
Tags: git, beginners
Slug: git-introduction
Authors: David
Summary: Basics about using git
Status: published
---

![git logo]({static}/images/git_logo.jpg)

[TOC]


# Co je Git ?

Git je nástroj na správu revizí vašich souborů, které určíte, že mají být sledovány Gitem. To znamená, že Git zaznamenává veškeré změny, které byly v souboru provedeny od jeho založení až po jeho dokončení. Můžeme se v historii díky gitu i vracet k úpravě, kterou jsme udělali třeba před půlrokem a tuto revizi si vytáhnout a pokračovat jiným směrem. Jinými slovy měli jsme-li nějaký soubor, který jsme nějak upravovali, ale usoudili jsme, že úpravy v posledním měsíci nebylo to pravé a zjistli jsme, že jsme se vydali slepou uličkou, můžeme se vrátit k verzi, kterou jsme udělali před měsícem a pokračovat jiným způsobem. Git nedělá nic automaticky je třeba mu vše říct a manuálně popsat co má udělat. Třeba Word, google zaznamenává změny automaticky oproti Gitu. U Gitu je nutné více přemýšlet co verzovat co commitovat apod. Ale pokud postupujete správně velmi pěkně se dá v historii verzí číst.

S tím souvisí i online služby jako GitHub nebo GitLab. Tyto služby pouze poskytují na webu naše git repozitáře s jejich historií. Nestarají se o udělání revize apod. Nahráváme tam revize na které se ostatní z týmu mohou podívat.

# Instalace Git

Instalace se liší dle vašeho OS.

Instalace Git je velmi pěkně popsána na těchto stránkách:

[naucse.python.cz](naucse.python.cz/2020/brno-jaro-pondeli/git/install/)

---

Celý Git workshop vč. instalace naleznete také na youtube:

[www.youtube.com/watch?v=zOWcQezeyIU](www.youtube.com/watch?v=zOWcQezeyIU)

# Stavy souborů v Git

![git stages](https://www.commercialprogression.com/sites/default/files/git-operations.png)

![git stages](https://i.stack.imgur.com/zLTpo.png)

**1. Změněn či nesledován (Working directory)**

V této fázi můžeme naleznout dva typy souboru. Oba dva typy souboru jsou označovány po příkazu git status červenou barvou.  První typ je soubor, který je uložen v pracovní složce ale git jej nesleduje a neví o změnách, ke kterým v tomto souboru dochází.  Po příkazu git status jsou označovány jako untracked files. Druhým typem je soubor, který sice již byl přidán, následně změněn, commitnutý, ale znova změněn. Tento soubor je nyní registrován jako modified a to červeně. Pokud se nám změny v modified souboru líbí tak soubor znovu pomocí git add přidáme do stage faze odkud jej mužeme commitnout.

**2. Připraveno k zapsání (Staged - staging area)**

To je fáze, takového pre-commitu je to soubor, který si připravuju ke commitu, dělám na něm ještě změny. Až své změny dokončím přejdu ke commit fázi. V této fázi můžeme vzít soubor zpět ze sledování gitem nebo ho dle libosti upravovat, jak se mi zlíbí. Můžeme to také nazvat jako přípravna - prostor, kde připravujeme soubor ke konečné revizi. Soubory, které máme uloženy v fázi staged poznáme také tak, že pokud zavoláme command git status, tak soubory které jsou ve fázi staged jsou zelené a pokud nemáte povoleno color.ui a nemáte tak povoleno barevné výstupy z gitu tak jsou soubory označeny větičkou "changes to be commited:" a před každým souborem připravným ke commitu je buď new file nebo modified. V této fázi lze také soubor ze sledování odebrat a to pomocí příkazu `git rm --cached <file>`, ono i git vám po git status vypíše nápovědu, která vypadá takto use`git rm --cached <file>...` to unstage.

**3. Zapsáno (Committed - git directory, repository)**

Konečné nevratné zapsání změn do master nebo do vedlejší větve. Tímto potvrzením se zapíší na dobro do historie změn daného souboru. Změny provedené v commit lze zase zpět postup je následující:

```
$ git commit -m "Something terribly misguided"
$ git reset HEAD~
<< edit files as necessary >>
$ git add ...
$ git commit -c ORIG_HEAD
```

# Základní příkazy

**`git clone <URL>`**

Je něco podobného jako git init s tím, že vytváří repozitář tak, že ho celý stahuje přímo z nějaké internetové služby jako je například. GitHub nebo GitLab. Po zadání takového příkazu se nám z online lužby stáhne celý repozitář i s historií gitu.`<URL>` bude většinou vypadat jako https://github.com/username_1/nazev_clonovaneho_repozitare

---

**`git init`**

Vytvoří z prázdné složky ve vašem počítači nebo složky projektu repozitář. Jinými slovy můžeme říct také, že pomocí tohoto příkazu řekneme gitu, že v tomto adresáři chcem spravovat verze souborů.

**_Repozitář_** - je složka, v které sledujeme provedené změny v souborech.

---

**`git add`**

Pokud chceme aby git sledoval změny provedené v daném souboru musíme tento soubor pomocí tohoto příkazu zaregistrovat/přidat, čímž říkáme gite chceme ať tento soubor sleduješ, změny v něm provedené. Tedy z `untracked files` vytvoříme `staged files`

Příklady použití:

    1. přidání konkrétních souborů

`git add  <jmeno souboru1> <jmeno souboru2>`

    2. přidání všech dostupných souborů

`git add --all` zkráceně `git add -A` nebo `git add .`

---

**`git commit`**

Tento příkaz udělá novou revizi, nový bod v historii. Zapíše do historie nově provedené změny v souboru. Součástí každého commitu by mělo být stručně popsáno jaké změny jsme provedli. Po tomto příkazu se nám otevře textový editor pro příkazovou řádku (nano, vim, notepad). V tomto editoru napíšeme změny, které jsme udělali a proč jsme takové změny udělali a text uložíme. Příkaz můžeme napsat pouze jako git commit, v tomto případě se nám zapíší veškeré změny ve všech souborech.

Je také možné napsat:

`git commit <jmeno souboru1> <jmeno souboru2>`

v tomto případě se provede commit pouze na vypsané soubory.

**Jak správně napsat zprávu do commit:**

Nejdříve napíšu na **první řádek** jasně stručně co jsem udělal.

Potom vynechám řádek a rozepíšu se podrobněji o změnách a proč jsem je udělal. To proto že při ukázání více comittů se zobrazuje vždy první řádek. První řádek půjde vždy všude vidět.

**Ukázka zprávy v commitu:**

Přidal jsem funkci sečti a také funkci validátor která funkci sečti doplňuje.

Tyto dvě funkce jsem přidal proto a proto a také díky nim je kód kratší a program je rychlejší.

Níže jsou další zdroje _"jak správně napsat commit"_:

* [GitHub - Writing good commit messages](https://github.com/erlang/otp/wiki/Writing-good-commit-messages)

---

**`git status`**

Zeptáme se gitu co si myslí o aktutálním stavu v současném repozitáři. Dává informaci, které soubory jsou sledovány, které naopak nikoliv. Nebo které soubory byly modifikovány a čekají na commit.

Pokud nám git status vypíše:

```
*On branch master*

*nothing to commit, working tree clean*
```

První řádek znamená, že jsme na větvi (branch) hlavní linie (master)

Druhý řádek znamená, že od posledního commitu nedošlo k žádným změnám ve sledovaných souborech. Nejsou dostupné žádné změny ke commitu.

---

**`git diff`**

Ukazuje změnu v souboru modified, oproti souboru, který byl už commitnutý. To znamená, že se jedná o soubor, který byl změněn, ale nebyl ještě přidán pomocí git add do fáze stage.

---

**`git show`**

Nám ukáže poslední revizi, kterou jsme provedli pomocí `git commit`. Pokud na konci revize vidíte dvojtečku `:` tak je revize delší než je příkazová řádka schopna vypsat. Pomocí `šipek` nebo `PageDown, PageUp` můžeme v celé revizi scrollovat. Pokud chceme z vypsání revize odejít, musíme zmáčknout klávesu s písmenem `q`.

Below you can see on picture result from command `git show`. Every commit has its own unique code - it is second line on picture. There are also information abou Author which you set with `git config`. Information about date when commit was done.

After Date is text which you write when you were commiting file.

Zbytek je sekce diff v které je popsána samotná změna celé revize zaregostrované pod jejím kódem. Řádky které byly přidány do daného souboru tak začínají symbolem "+", naopak řádky které byly odebrány mají na začátku znaménko "-".


Filosofie gitu je kontrolovat změny vždy v jednom řádku. stačí tedy, že v řádku změníte jedno písmeno a git to vyhodnotí, že celý řádek byl změněn. Konrétní revizi lze ukázat také pomocí `git show <kód revize>`


![git show terminal](https://zlargon.gitbooks.io/git-tutorial/startup/commit_a_patch/git_show.png)

---

**`git log`**

Mi ukáže seznam všech revizí, které byly v daném repozitáři provedeny. Na začátku je vždy nejposlednější revize.

---

**`git stash`**

Odložení dělání věci, kterou chceme na chvíli pozastavit. Musíme opravit jinou chybu msuíme jít dělat něco jiného. Není ješte ready na commit.

Vrácení se k odložené práci se vrátíme pomocit `git stash apply`.

Když jsme si odložili více práce tak pomocí `git stash list`  si je všechny vypíšeme. A zjistíme pod kterým číslem se nachází práce na které chceme zrovna pokračovat.

---

**`gitk --all`**

Rozjede grafické okno gitu. Není moc hezké, ale je velmi funčkní.

---

**`git reset`** (např. `git reset README.md`)

Změnu, kterou jsme v souboru provedli se smaže.

# Jak uložit změny bez "commitu"

Čas od času se vyskytne následující situace: Pracujete na nějaké feature pro daný projekt. Pro tuto featuru jste si vytvořili novou větev a udělali jste první nástřel změn, o kteých máte pocit, že by mohli být těmi správnými k dosažení cíle.

Teď nastane okamžik, kdy práci musíte ale přerušit a dodělat nějaký detail na jiné branchi. Ovšem Vaše změny na současné branchi nejsou vůbec dodělané ve fázi, že byste je chtěli commitnout. Jedná se o nějaký nástřel Vašich myšlenek, ale vůbec nevíte jestli je to správná cesta. Nechcete změny commitnout, ale zároveň o změny ani nechcete přijít. Chcete na ně po dokončení prioritnějšího úkolu navázat. Potřebujete je jen dočasně někam uložit. První vás napadne změny by se mohli uložit automaticky... Takhle ale Git nefunguje ve chvíli, kdy se budete chtít přepnout z větve, kde jsou provedené změny, ale nejsou commitnuté, měli byste dostat nějakou takovouhle hlášku:

```
$ git switch <different_branch>

error: Your local changes to the following files would be overwritten by checkout:
	<some_file_1.py>
	<some_file_2.py>
Please commit your changes or stash them before you switch branches.
Aborting
```

Když si hlášku pozorně celou přečtete, tak uvidíte, že Git Vám na konci radí, že pokud chcete přepnout ze současné větve na jinou tak udělejte `commit` nebo `stash`.

Commit už známe a `git stash` je přesně to co hledáme. Tento příkaz nám umožní své změny uložit do gitu a později se k nim vrátit.

## Použití git stash

Tento příkaz vám umožní uložit si změny, které jsou v danou chvíli ve `staged` nebo v `unstaged`. Po příkazu `git stash` můžete přepínat větve commitovat další změny apod. Je nutné si dát, ale pozor, že toto uložení je pouze ve vašem lokální repozitáři. Pokud provedete `git push` stashed files se na server neposílají.

V praxi použití příkazu `git stash` může vypadata nějak takto:

```
$ git status

On branch master Changes to be committed:
    new file: hello.py
Changes not staged for commit:
    modified: index.html

$ git stash

Saved working directory and index state WIP on master:
3022f53 our new homepage HEAD is now at 3022f53 our new homepage

$ git status

On branch master nothing to commit, working tree clean
```

Pokud budete chtít změny uložené v gitu zase aplikovat do svého projektu použijete `git stash pop` nebo `git stash apply`

**`git stash pop`**

Tento příkaz aplikuje změny ve stash do vašeho projektu a zároveň tyto změny ze stash vymaže.

```
$ git status
On branch master nothing to commit, working tree clean

$ git stash pop
On branch master Changes to be committed:
    new file: hello.py
Changes not staged for commit:
    modified: index.html
Dropped refs/stash@{0} (32b3aa1d123dfe6d57b3c3cc2c45cbf3f456cc6a)
```

**`git stash apply`**

Tento příkaz aplikuje změny ve stash do vašeho projektu (větve), ale změny uložené ve stash zachová. To se může hodit například pokud chcete stash aplikovat do více větví.

```
$ git stash apply
On branch master Changes to be committed:
    new file: hello.py
Changes not staged for commit:
    modified: index.html
```

**POZOR:** Git defaultně neukládá do stash untracked nebo ignore soubory.

# Větvení v Gitu

**`git branch`**

Vypíše seznam všech větví, které jsou v projektu vytvořené

---

**`git branch <nazev_nove_vetve>`**

Vytvoření nové větve s názvem "nazev_nove_vetve". Nazev nové větve se píše bez mezer.

---

**`git branch --delete <nazev_vetve>`**

zkráceně `git branch -d <nazev_vetve>`

Vymazání konkrétní větve se jménem <nazev_vetve> v projektu

---

**`git branch -D <nazev_vetve>`**

Vymazání konkrétní větve se jménem <nazev_vetve>, která nebyla mergnutá nebo pushnutá a musíme ji vymazat tzv. force delete

Výše uvedené příklady vymažou větev pouze na lokálním gitu. Pokud současně kód nahrávate např. na GitHub tak větev na Githubu zůstane i když jste po smazání větve na local gitu udělali `git push origin master`. Pro smazání větve také na remote musíte zadat další kód:


`git push <remote> --delete <nazev_remote_vetve>`

zkráceně `git push <remote> -d <nazev_remote_vetve>`

Vymaže větev také na remote.

---

**Původní příkazy:**

**1. `git checkout <nazev_vetve>`**

Přepnutí se ze současné větve na novou větev s názvem "nazev_vetve"

**2. `git checkout <jmeno_souboru>`**

Zahození změn v souboru se jmenem "jmeno_souboru"

---

**Nové příkazy:**

**1. `git switch <nazev_vetve>`**

Přepnutí se ze současné větve na novou větev s názvem "nazev_vetve"

**2. `git restore <jmeno_souboru>`**

Zahození změn v souboru se jmenem "jmeno_souboru"


Příkaz `git checkout` může být trochu matoucí. Jelikož od verze gitu tuším 2.24 v gitu přibyly další dva příkazy a to `git switch` a `git restore`. Původně před touto implementací dvou nových příkazů se příkaz `git checkout` používal pro dvě naprosto rozdílné činnosti a to na za **1. změnu větve** - a to v případě, kdy jste `git checkout` dali jméno větve nebo **2. zahazovaly se změny v souboru** - to v případě, kdy jste příkazu `git checkout` dali jméno souboru. Tyto dvě operace spolu vůbec nesouvisí a tak bylo dlouhá léta příkaz `git checkout` trochu matoucí na co se vlastně používá. Z tohoto důvodu se nově zavedli dva rozdílné příkazy pro tyto dvě operace ať je situace zcela jasnější.

Tedy, nově se pro změnu větve používá `git switch <jmeno_vetve>` a pro zahození změn v souboru se používá `git restore <jmeno_souboru>`. Tyto nové příkazy mají také i novou implementaci a proto úkonům jako je změna větve dochází u `git switch` trochu jinak než u `git checkout`. Tak samo u `git checkout` a `git restore`. Toho si můžete všimnout když pomocí nových příkazů budete chtítí udělat to co jste v minulosti dělali pomocí `git checkout`, tak že výsledek může být malinko odlišný.

**`git merge <nazev_vetve>`**

Sloučí větev na které jsme zrovna přihlášeni (nejčastěji to bude větev master) s větví, kterou zadáme v příkazu jako "nazev_vetve".

# Remote příkazy

Remote znamená vzdálené repozitáře na Githubu např. Jak už jste viděli někde `origin`, tak to je jméno jednoho z remote, konkrétně `origin` je jméno repozitáře odkud jsme prováděli `git clone`. Když si založíme na svém počítači repozitář pomocí `git init`, tak nebudeme mít nastavené žádné remote.
`origin` znamená také základní remote, v kterém jsou všechna data, která jsme si stáhli pomocí `git clone`. Je to zdroj našeho stáhnutého repozitáře z online služeb jako je GitHub.

**`git remote`**

Vypíše všechny remote uložené v projektu

`git remote --verbose` nebo `git remote -v`

Vypsání seznamu všech remote v tz. **modu verbose**, tedy ukecanější podrobnější výpis všech remote

---

**`git remote add <jmeno_remote> <url_repo_na_github>`**

Způsob ja přidat další remote do vašeho seznamu remote.

`<jmeno–remote>` bude nejčastěji váš nick nebo nick člověka na githubu, který má stejný repo. Jedná se o jednoduchý název pro remote, aby ste jej mohli snadno v seznamu a při použití příkázů identifikovat. Přece jen je sadnější psát jméno remote než celé url od remote.

---

**`git remote remove <jmeno_remote>`**

Smaže ze seznamu uložených remote deifonovaný <jmeno_remote>

Můžeme použít také zkrácený příkaz, který se používal ve starších verzích gitu `git remote rm <jmeno_remote>`

---

**`git fetch <remote> <branch>`**

Fetch znamená, že mohu aktualizovat svůj repozitář např. z `remote origin`, tedy změny, které ve svém repozitáři nemám a došlo k nim od jiných uživatelů. Příklad udělal jsem si `git clone <URL>` a projektu jsem se půl roku nevěnoval. Teď bych na něm chtěl začít pracovat, ale můj stažený repozitář v mém počítači (local) je odlišný od repozitáře uložený na GitHubu, jelikož ostatní na tomto projektu pracovali. Musím si tedy svůj lokální repozitář updatovat s repozitářem na Githubu abych dělal na aktuální verzi. Ale pozor `fetch` stáhne pouze nová data, ale nezakomponuje je do Vaší větve pomocí `merge`. To je hlavní rozdíl od `git pull`. `Fetch` nezakomponuje změny do našeho `local branch`.

---

**`git pull <remote> <branch>`**

Vyjadřuje jednoduchá rovnice --> `git pull` = `git fetch` + `git merge`

---

**`git push <remote> <branch>`**

Je opakem `fetch`, uděláme novou změnu a chceme ji zakomponovat do `origin`. Pošleme tuto změnu pomocí `git push origin master` naši vytvořenou změnu. Autor projektu usoudí jestli se mu naše změna líbí či ne a zda ji tedy zakomponuje do svého projektu.


Abychom to mohli poslat do `originu` který není náš, musíme nejdříve na githubu forknout originální projekt. Poslat naši zmenu na náš forknutý repo pomocí `git push <jmeno_remote> <jmeno_branch>`. Následně si na GitHubu najdou tlačítko `New pull request`. Pokud tedy budu chtít pushnout své změny na origin musím to udělat přes GitHub přes svůj forknutý repo. Postup by byl tedy `git clone <origin-url>`, potom na github `fork` origin projektu, poté udělám změny u sebe na localu pošlu je na svůj github a poté zmáčknu `New pull request`.

**pull request:** žádost o začlenění. pošlu autorovi prosbu o začlenění mých změn. Nastavuji na kterou větev to posílám na originu jakou větev svou chci začlenit.


![Diagram workflow](https://naucse.python.cz/course/pyladies/git/collaboration/static/gh-workflow-diagram.svg)

![scheme workflow]({static}/images/git_stages_flow.png)

# Ignorování souborů

Způsob ignorování souborů rozdělujeme do třech skupin, dle toho jaký typ souboru chceme ignorovat.

**1. Ignorování souborů a složek, které automaticky vytváří pouze náš počítač dle OS**

Jedná se o ignorování souborů či složek, které se vytváří pouze na našem počítači. Jedná se o soubory, které vytváří náš operační systém nebo náš editor textu (např. cache/, .vscode/). Tyto soubory se nám vytvoří automaticky při spuštění jekéhokoliv projektu a bylo by otravné je pokaždé znova nastavovat k ignoraci. Pro ignorování takových souborů je třeba si vytvořit svůj vlastní soubor do kterého napíšeme, které soubory či složky se mají ignorovat.

`git config --global core.excludesfile /home/user_1/Documents/<název_vaseho_souboru>`

Tímto příkazem nastavíte v gitu, který máte nainstalovaný na PC cestu k souboru, v kterém je zapsáno, které soubory a složky má git ignorovat a nevšímat si jich.

**2. Soubory, které vytváří Váš pythonní program**

Jedná se o soubory, které jsou vytvořeny při běhu skriptu. Například nějaké csv, nějaký obrázek či graf.

**3. Soubory, v kterých jsou napsány citlivé údaje**

Jedná se o soubory, v kterých jsou napsána hesla, API klíče nebo citlivé údaje ohledně soukromí. Tyto soubory se týkají většinou pouze jednoho specifického projektu a proto se nepíšou do souboru, který globálně ignoruje specifikované soubory a složky, jak bylo uvedeno výše. Mohou být totiž pro každý projekt jiné. Tyto soubory se specifikují v inicializované složce .git v daném projektu. Tedy v gitu, který sleduje pouze tento projekt.

Cesta k tomuto souboru je:

```
.git/info/exclude
```

# Další nástroje, které se používají společně s gitem

**`tig`**

Je to nástroj jehož název je git naopak. slouží ke seznamu všech commitů. Něco jako `git log`, ale daleko podrobnější.

# Použité zdroje - další studium

Web z kterého čerpám nejvíce:

[naucse.python.cz/course/pyladies/sessions/foss/](naucse.python.cz/course/pyladies/sessions/foss/)

Velmi povedená stránka na základní Git příkazy

[atlassian.com - git](https://www.atlassian.com/git/tutorials/saving-changes/git-stash)

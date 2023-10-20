---
Title: Git - fix your history
Date: 2020-8-31
Category: Git
Tags: git, intermediate
Slug: git-fix-history
Authors: David
Summary: How can you fix your git history
Status: published
---

![git logo]({static}/images/git_logo.jpg)

[TOC]

# 1. Změna posledního commitu

S příkazem `commit` můžeme použít tzv. `flags`, které upravují chování tohoto příkazu. Jedním z takových `flags` je `--amend`. Pomocí tohoto flags měníme poslední commit.

Pomocí přikzu `$ git commit --amend` můžeme:
1. kombinovat změny, které máme v tuto chvíli ve `staged` fázi s posledním `commitem`
2. změnit poslední `commit message`, v které jsme udělali chybu nebo překlep. Ovšem tato změna změní uložení commitu a v historii ji budeme vidět s hvězdičkou (*). Tedy vytvoří se nový commit se stejnými informacemi, ale jinou zprávou a navíc bude obsahovat hvězdičku.

**1. Přidat soubory ve staged fázi do posledního commitu**

Představme si následující sled událostí:

Editujeme soubory `hello.py` a `main.py`. Po ukončení změn přidáme do gitu pouze `main.py` a provedeme commit. V příkazové řádce by úkony vapadly nějak takto:

    $ git add main.py
    $ git commit

V tuto chvíli si autor uvědomí, že zapomněl přidat do gitu také soubor `hello.py`, který chtěl mít ve společném commitu také se souborem `main.py`, který už je ale v tuto chvíli commitnutý. Tento problém se při vývoji objevuje poměrně čast a git si s touto situací umí hravě poradit.

Postup opravy může vypadat takto:

    $ git add hello.py
    $ git commit --amend --no-edit

Použitý flag `--no-edit` nám zajistí, že se zapomenutý soubor přidá do posledního commitu, ale `commit message` se nezmění. Tedy flag `--no-edit` = chceme přidat nové změny do posledního commitu bez úpravy `commit message`.

**2. Změna zprávy v posledním commitu**

Pro změnu poslední `commit message` použijeme tento příkaz:

    $ git commit --amend

Tímto příkazem se nám objeví námi defaultně nastavený editor textu pro git a v něm poslední zpráva tu můžeme libovolně upravit a následně změny potvrdit, jak jsme zvyklý u běžných `commitů`.

Jednořádková změna `commit message` se provádí pomocí príkazu:

    $ git commit --amend -m "your new or updated commit message"

Když přídáme do příkazu options `-m` můžeme změnit ři přepsat `commit message` přímo v příkazové řádce aniž bychom museli otevírat textový editora celý proces se takto výrazně zrychlí.

**_Upozornění_:** Příkaz amend nepoužívejte pokud jste změny už poslali do public prostoru třeba na GitHub. Jelikož `--amend` udělá nový commit, tak bude problém jej pushnout do stejné větve na remote. Jak jsme si řekli `--amend` udělá nový commit na větvi a ten starý z ní zmizí, při pushnutí této změny dojde ke konfliktu.

# 2. Změna jednoho, libovolně starého commitu

Změna se provádí pomocí příkazu `git rebase`. Tento příkaz je poněkud složitější a podíváme se tedy na něj v kapitole [Git rebase](#4.-git-rebase) trochu blíže.

Pro změnu konkrétního starého commitu můžeme použít tento příkaz:

    $ git rebase <id_old_commit>

**_id_** - bude hash commitu

Tento příkaz započne proces `rebase`. Proces se zastaví a dá nám na výběr co můžeme udělat.
Většinou pomocí příkazu `--amend` uděláme změny a následně řekneme procesu `rebase`, že může pokračovat. Proces by mohl vypadat nějak takhle:

    $ git commit --amend
    $ git rebase --continue

# 3. Změna několika, libovolně starých commitů

Pro změnu několika commitů najednou se používá tzv. **interaktivní rebase**. Tento typ `rebase` se zapíná pomocí příkazu:

    $ git rebase -i

nebo

    $ git rebase --interactive

Během `rebase` několika commitů najednou máme možnost si vybrat z několika možností jak takové commity spojit dohromady.

1. **Reword nebo zkráceně 'r'** - zastaví proces `rebase` a nechá Vás přepsat konkrétní `commit message`
2. **Squash nebo kráceně 's'** - během procesu `rebase`, všechny commity označené pomocí `s` se sloučí s posledním commitem. Proces `rebase` se pozastaví a budeme vyzvání k přepsání posledního commitu.
3. **Fixup nebo zkráceně 'f'** - se chová podobně jako `squash`. Narozdíl od `squashe`, tak `fixup` nepozastaví proces `rebase` k otevření textového editoru. `commit meassage` zůstane stejná jako je poslední v posledním `commitu` pouze se tomuto poslednímu commitu přilepí commity, které jsme označili písmenem `f`. `commit messages` obsažené v commitech, které jsme označili pomocí `f` jsou zahozeny.

**drop**

Kromě spojování commitů, je možné v interaktivním rebase také commity smazat pomocí slovíčka `drop` nebo `d`. Smazat commit je také možné pokud před daný commit nedáte žádné specialní slovo.

**pickup**

Slovo `pickup` nebo `p` znamená, že tento commit chceme zachovat vzít.

V interaktivním rebase můžeme také **přehazovat pořadí jednotlivých commitů**, jak v historii gitu půjdou za sebou.

# 4. Git rebase

Pro lepší pochopení celého kontextu se nevyhneme detailnímu popsání příkazu `git rebase`.

Na začátek `git rebase` a `git merge` jsou v základu stejné příkazi. Oba dva slučují jednu větev do druhé. Ale každý to dělá jinak. Na konci článku je část, která se zabývá přímo srovnáním těchto dvou příkazů.

Příkaz `git rebase` je možné používat ve dvou módech:

1. standardní či manuální mód
2. interaktivní mód (pomocí přepínače `-i` nebo `--interactive`)

Nejčastejší použití rebase můžeme vidět, když máme projekt, který je na větvi `master`. Tento projekt potřebuje vyvinout novou featuru. Pro tyto účely si založíme novou větev `feature_branch`. Na nové feature budeme pracovat nějaký čas. A v tomto čase, kdy mi budeme pracovat na feature, kterou jsme dostali za úkol, bude zbytek týmu pracovat na dalších features projektu. Tím se samozřejmě podoba větve `master` změní od podoby, z které jsme vytvořili novou větev `feature_branch`. Tento proces můžeme vidět na diagramu níže:

    a - b - c - g - h  (master)
         \
          d - e   (feature_branch)

Novou větev `feature_branch` jsme vytvořili když větev `master` měla poslední commit `c`. Nyní když bych chtěl mou featuru mergnout tak větev `master` se posunula o další dva commity `g` a `h`. Abychom mohli naši větev pěkně mergnout musíme na ni udělat nejříve udělat `rebase`. Tedy chceme založit naše další změny na změnách ostatních - “I want to base my changes on what everybody has already done.”

# Užitečné odkazy - další studium

Text článku byl čerpán hlavně z těchto zdrojů:

* [https://www.atlassian.com/git/tutorials/rewriting-history](https://www.atlassian.com/git/tutorials/rewriting-history)

* [https://www.atlassian.com/git/tutorials/rewriting-history/git-rebase](https://www.atlassian.com/git/tutorials/rewriting-history/git-rebase)

* [https://dev.to/martinbelev/how-to-effectively-use-git-rebase-onto-5b85](https://dev.to/martinbelev/how-to-effectively-use-git-rebase-onto-5b85)

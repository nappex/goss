---
Title: Základní přehled licencí
Date: 2022-06-01
Category: license, unix, foss
Tags: advanced, freebsd, unix
Slug: licenses-explanation
Authors: David
Summary: Seznam licencí a jejich rozdíly
Status: published
---

[TOC]

# Úvod

Svůj kód a nebo jakýkoliv výtvor (obrázky, GIFY, loga) si můžete nechat
doma sami pro sebe nebo jej můžete také veřejně všem ukázat či poskytnout.

Licence jsou potřeba kdykoliv svůj kód dáváte veřejně k dispozici.
Licencí vlastně definujete pravidla, jak se s Vaším kódem může zacházet.
Zda si jej můžete jen přečíst nebo zda si s ním můžete dělat cokoliv chcete.
To může znamenat také klidně to, že tím dovolíte, aby si někdo váš kód
zkopíroval, upravil a nikdy svůj kód už nikdy nikomu neukázal a použil jej
například jako proprietární soft.

Poul Henning Kemp například tvrdí, že jsou stejně všechny licence k ničemu
a proto vymyslel svou Beer-ware Lincense, která říká, že si s jeho kódem
dělejte co chcete a pokud vám přišel užitečný, tak mu můžete někdy koupit pivo.

Na [wikipedii](https://en.wikipedia.org/wiki/Permissive_software_license)
je krásná tabulka rozdělení licencí.

Licence dle této tabulky dělíme na:

## Veřejné licence

1. **Public domains & equivalent** - bez jakýchkoliv restrikcí
    * sofwarove licence - PD, CC0
    * ostatní kreativní práce - PD, CC0

2. **Permissive license**, také známé jako **BSD-like** nebo **BSD-style**
Jedná se o licence s minimálními restrikcemi, tzn. s touto licencí můžete
například z FOSS kódu udělat proprietární.
    * sofwarove licence - BSD, MIT, Apache
    * ostatní kreativní práce - CC-BY

3. **Copyleft License** - zakazuje z public kódu udělat proprietární. Tento
pojem vymyslel Richard Stallman, resp. organizace FSF, jako opak ke Copyright.
Hlavním smyslem této license je, že si můžete s kódem dělat co chcete, za
podmínky, že musí být licencován opět pod copyleft licencí.
    * sofwarove licence - GPL, AGPL
    * ostatní kreativní práce - CC-BY-SA

4. **Noncommercial licence** - dovoluje použití pouze pro nekomerční účely.
    * sofwarove licence - JRL, AFPL
    * ostatní kreativní práce - CC-BY-NC

## Neveřejné licence

5. **Proprietary license** - nemáte žádné práva, kód je uzavřený a nemáte
opravnění s ním jakkoliv nakládat.
    * sofwarove licence - proprietary software, no public license
    * ostatní kreativní práce - Copyright

6. **Trade secret** - tajný kód, ke kterému se veřejně vůbec nedostanete.
Příkladem může být, že ho má někdo doma uschovaný v šuplíku.
    * sofwarove licence - private, internal software
    * ostatní kreativní práce - unpublished
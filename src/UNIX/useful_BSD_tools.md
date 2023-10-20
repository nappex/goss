---
Title: Užitečné nástroje pro správu FreeBSD
Date: 2022-05-30
Category: BSD, unix
Tags: FreeBSD, beginner, unix
Slug: useful-BSD-tools
Authors: David S
Summary: Seznam užitečných nástrojů pro začínající uživatele FreeBSD
Status: published
---

[TOC]

# Nástroje built-in
Tedy vestavěné, které jsou součástí instalace FreeBSD. Tyto nástroje
je možno používat bez další instalace čehokoliv.

## Analýza systému

`vmstat`

Jednoduchý příkaz, který nám řekne, kde je problém, zda v CPU, I/O nebo RAM.

`top`

`ps`

`ps aux`

## Nástroje pro správu disků

Standardně jsem používal `lsblk`, ten je ovšem nutné doinstalovat, což může
být občas při nefunční Wi-Fi a počátečním nastavení systému problém.

`gstat -a` výpis disků

### Výpis disků

`geom disk list`

`gpart show`

`gpart list`


## Síť

`sysctl net.wlan.devices`


`netstat`


## Virtualizace

`Bhyve`


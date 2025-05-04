date: 2025-05-04
title: How install FreeBSD to raspberrypi 4 with ZFS and encryption

## Overview

I've started to write in Czech, because I have no time to write correctly in english. When the article will be complete, then
the translation will be done.

Moje představa čeho chci dosáhnout.
Chci mít raspberry pi jako domácí server, která ze začátku bude provozovat domácí NAS, v jednom jail bude NextCloud a v druhem HomeAssistent.
Postupně asi přibydou ještě další jaily jako služby.
Nastavení FreeBSD dle ých představ.

- Nepoužívat SD kartu, nemá velkou životnost a hrozí náhlé poškození. Není úplně vhodná na velký počet zápisů při konstatně běžícím serveru.
- Použít externí harddisk pro FreeBSD filesystem používat ZFS
- Všechny partitions, které bude možné šifrovat tak zašifrovat. Určitě nebude možné zašifrovat `/boot` a `/`, kvůli ssh přístupu. Musel bys pak po každém restartu být fyzicky s monitorem u raspberrypi a napsat heslo, aby se odšifroval disk a vše najelo včetně ssh. Budu chtít mžná někdy restarovat server i na dálku a pak bych neměl možnost ho na dálku hned zase spravovat.
- Vzhledem k výše uvedeným požadavkům bude muset být asi instalace ručně přes příkaz bsdinstall nebo úplně ručně nakopírování souborů na spprávná místa.
- naposled nastavení WireGuard na mé VPS servery, abych měl přístup odkudkoliv přes VPN

Možné postupy nastavení FreeBSD na raspberrypi4:

1. Instalace FreeBSD na SD kartu pomocí oficiálního custom image stáhnutého z oficiálních stránek projektu FreeBSD. Tato možnost je nejjednodušší a funguje - odzkoušeno. Image se flashuje přímo na SD kartu pomocí příkazu `dd` nic se tedy ani neinstaluje. Je nunté celý systém nastavit ručně pomocí `bsdconfig`, protože se nenastavují během instalace, jak jsme zvyklí. Tento postup nesplňuje to výše uvedené požadavky. SD karta není vhodná a custom image je proveden s filesystémem typu `UFS`.
2. Vytvoření SD karty s custom imagem pro rpi4 a následná instalace pomocí `bsdinstall` s ZFS na SSD disk připojen přes USB. Instalace funguje, ale systém bootuje
3. Vytvoření SD karty s custom imagem pro rpi4 instalace na SSD disk, ale bez boot partition. Nakonec udělat `/boot` dle FreeBSD na SD kartě a nastavit, aby bootovala root z SSD disku.
4. Vytvoření SD karty s custom imagem pro rpi4 instalace na SSD disk, ale bez boot partition. Nakonec udělat `/boot` dle Linux na SD kartě a nastavit, aby bootovala root z SSD disku.
5. Vytvoření SD karty s custom imagem pro rpi4 instalace na SSD disk, ale bez boot partition. Nakonec udělat dát na SD kartu raspberyOS a nastavit `/boot`, aby bootovala root z SSD disku. Zároveň zachovat originální soubory, abych mohl v případě potřeby nabootovat raspberryOS k nastavení a aktualizaci samotného raspberry hardwaru jako eeprom nastavení bootvacích priorit apod.


Problémy, které je třeba vyřešit:

1. jak má správně vypadat boot partition pro raspberypi, prý musí být u-boot.bin, DBT files a ještě nějaká konfigurace. Tohle se bude muset odzkoušet pokus omyl. Ideálně asi začít s variantou 5. Zde doufám, že by mohlo stačít pouze přepsat cestu na root v configu, ale dle internetu to moc nevypadá. Boot musí být specifický pro daný typ operačního systému. Aby FreeBSD správně nabootovalo musí mít boot nastavený a mít soubory vhodně pro FreeBSD ne pro rapsberryOS. Tedy potom možná bude nejlepší začít s plnou instalací na SSD disk a zkoušet upravovat boot partition na SSD disk aby se zjistila správná konfigurace a až potom zkoušet na SD kartě včetně změny cesty na root. Bohužel nedaří se mi namountovat boot partition, ale to asi proto, že to není ZFS zkus ji namountovat klasicky jako `mount /dev/da0p1 /mnt/boot` to by mělo fungovat, dělal jsi pouz zpool import ale ten řeší jen ZFS boot není typu ZFS - pozor na to!
2. jak udělat ZFS disk včetně oddělených partitions k jejich šifrování.
3. Jak mountovat a umountovat ZFS
4. Co znamenají cesty v ZFS co je zpool, zroot apod.
5. Jak manuálně nainstalovat FreeBSD na manuálně vytvořený ZFS

---
Title: Introduction to network devices
Date: 2021-01-23
Category: Networks
Tags: networks, beginner
Slug: basics-networks-devices
Authors: David
Summary: Learn the main network devices
Status: published
---

[TOC]

# Repeater

Pracuje na vrstvě 1 - fyzická vrstva (physical layer)

Repeater je služebně nejstarší síťový prvek. V historii se v síťařině používal ikabely, ve kterých se signál se vzdáleností značně zeslaboval. Když jsme tedy chtěli zachovat sílu signálu (informace) na větší vzdálenosti, tak jsme museli po určité vzdálenosti signál zesílit. Toho se docílilo pomocí tzv. **REPEATERŮ**. Signál, který přišel do repeateru v něm byl pouze zesílen a poslán dále. Repeater vůbec neřeší jaký signál nebo informace je mu poslána pouze je zesílí.

Repeatery si můžete také představit jako čerpadla vody a kabely mezi repeatery jako hadice, které dopravují vodu k požáru. Čím dále jste od čerpadla tím menší máte tlak. Pokud potřebujete dopravit vodu na velkou vzdálenost a zachovat hasební tlak musíte do hadicové trasy přidat další čerpadla, která tlak vody zase zesílí.

# HUB

Pracuje na vrstvě 1 - fyzická vrstva (physical layer)

Hub není nic jiného než multi repeater. Tedy dokáže zesílit signál z více vstupů na více výstupů. Opět u něj platí to co u repeaterů, že pouze zesiluje signály. Nijak je nevyhodnocuje ani jim nerozumí.

# Bridge

Pracuje na vrstvě 2 - linková vrstva (data link layer)

Jedná se o zařízení, které funguje jak switch, ovšem chytré přeposílání signálu na základě protokolů a portů dělá pomocí softwaru. Je tedy daleko pomalejší než switch, který tento úkol řeší na úrovni hardwaru.

# Switch (Přepínač)

Pracuje na vrstvě 2 - linková vrstva (data link layer)

Ukládá MAC adresy zařízení na příslušné číslo portu, na kterém je zařízení ve switch připojen. Switch tedy vykonává rozhodovací proces na základě MAC adres. Jednoduch& mspojením MAC adresy s číslem portu v CAM Table.

Jedná se o takovou křižovatku síťového provozu na lokální úrovni, tedy spravuje pouze provoz na síti Local Area Network (LAN). Jinými slovy řídí síťový provoz pouze mezi zařízeními, které jsou připojeny na jednu stejnou síť. Toto není úplně správné protože exituje i tzv. VLAN tedy virtual local area network a switch je schopen propojit i dvě různé lokální sítě. Switch se chytře snaží signál přeposílat dle jeho parametrů. Dokáže vyhodnotit, na jaký port a MAC adresu je signál posílán. Díky těchto informací je schopen efektivně řídit komunikaci, vyhodnotit jak bude nejefektivnější signál poslat, aby nedocházelo ke střetům a zpomalení síťového provozu. Switch posílá signál na správný port, čímž komunikaci zefektivňuje.
Logika přeposílání signálu je řešena na úrovni hardwaru pomocí chytrých obvodů ASICs (Application Specific Integrated Circuits). Switch je schopen se učit na základě toho, že ví kde jsou síťová zařízení, kde jsou jejich MAC adresy v síti. Switch zkoumá tzv. header od zasíláného požadavku, kde vyčte informaci o MAC adrese. Tuto informaci si dynamicky ukládá do tzv. CAM table, což je tabulka, která je vyplněná MAC adresama, které se switch naučil, díky toho ví, kam rychle poslat MAC adresu s kterou se už jednou setkal. Tyto MAC adresy si ale swithc neukládá do nekončna, každá MAC adresa je doplněna tzv. parametrem TTL (time to live), tento parametr udává, jak dlouho má být MAC adresa ve CAM table uložena a když je tato doba překročena MAC adresa se z této tabulky smaže. K mazání musí docházet protože paměť na ukládání MAC adres není nekonečná. Kromě TTL se také ukládá konrétní číslo interface switche ke konrétní MAC adrese.


## Zdrojová MAC adresa

Celý proces vypadá asi takto, požadavek na zaslání informace přijde do switche. Ten se podívá do Headers (hlavičky) požadavku, tam vyčte MAC adresu zdroje informace (tedy unikátní adresu síťového zařízení, které požadavek posílá). Tuto MAC adresu porovná s adresami ve své tabulce, pokud tam není, tak ji přidá s číslem interface a TTL. Pokud už v tabulce MAC adresa je uložena, tak aktualizuje TTL. Pokud se připojila MAC adresa na jiné číslo interface, tak aktualizuje číslo interface.

## Cílová MAC adresa

Tzv. forwarding

Z hlaviček opět přečte switch destination MAC address. Podívá se do CAM table, pokud tam je posílá požadavek na interface spojen s touto MAC adresou. Pokud MAC adresa v CAM table není zašle požadavek dále přes všechny své interface.

Switch se také hodí pokud potřebuje příchozí signál rozdělit, tedy máme jeden vstup a potřebujeme je rozdělit na dalších 5 výstupů. Dá se tedy říct, že je to takový chytrý multi rozbočovač. Funguje tedy i jako klasická roztrojka, kterou máme doma a zvyšujeme pomocí ní počet výstupů ze zásuvky 240 V.

Switche obsahují většinou různé množství portů. Počet portů se pohybuje nejčastěji 5, 8, 16, 24, 48. Rychlosti switchů jsou 10, 100, 1000 Mb/s.

Switche pracují na tzv. linkové vrstvě neberou tedy v potaz nějaká práva apod. To znamená že bezpečnost se v nich neřeší. Ta se řeší až na vyšších vrstvách nebo na úrovni topologie sítě.

Switche se nejčastěji používají na rozšíření kabelové počítačové sítě (ethernet)

# Router

Pracuje na vrstvě 3 - síťová vrstva (Network layer)

Na rozdíl od Switche, Router vyhodnocuje IP adresy a na základě její hodnoty vyhodnocuje zda je nutné požadavek poslat do další sítě či nikoliv. Informace o IP adresách si router neukládá. Místo toho si ukládá informace o sítích do Routing Table, tedy do routing table si ukládá IP adresu sítě (Network portion) a Network mask.

Router používá dvě interfaces:

* Serial interface - používá PPP
* Ethernet interface - používá MAC adresy

PC_1, které chce poslat request na PC_2, které je na jiné síti, tak dochází k přwnosu informací následovně. PC_1 vyhodnotí zda IP adresa kterou hledáme je na stejné síti či nikoliv. Toho docílí pomocí AND. Kde kontroluje Network ID vlastní sítě a masky s cílovou IP adresou. Pokud vyhodnotí, že IP adresa není na stejné síti doplní požadavek nsáledovně - Layer 2 vyplní pomocí své MAC adresy jako Source address a destination address vyplni pomocí broadcast MAC adresy FF:FF:FF:FF:FF:FF. To se zašle na všechny zařízení v lokální síti. Na ni se najde IP adresa default gateway, což je náš router a ARP protokolem vrátí zpět svou MAC adresu. PC_1 si uloží do ARP cache dvojici IP adresu default gateway s MAC adresou našeho routeru.

Spojuje dvě různé sítě většinou se bude jednat a propojení mezi sítí Local Area Network (LAN - lokální síť) a Wide Area Network (WAN - Internet).
Routuje IP adresy mezi různými sítěmi.

# Modem

# Access Point

Access point nám vytvoří novou wireless local area network (WLAN). Pro představu router který máte doma je schopen vytvořit WLAN. Dosah této bezdrátové sítě je ale omezený výkonem, jak na vysílači, tak na příjímači. K zvětšení rozsahu stávající bezdrátové sítě můžete použít tzv. range extender vysvětlen níže. Nebo vytvořit úplně nový zdroj bezdrátové sítě pomocí acces pointu. Access point je zapojen kabelem do routeru, switche nebo hubu a vytváří nový zdroj nové bezdrátové sítě.

# Range extender

# Wireless LAN controller

If we have to manage and configure many access points. It is more efficient to manage them via Wireless LAN controller. But there is a problem Wireless LAN controller has not so many ports so if we have really a lot of access points we have to connect them to switch which is suitable for connection a very big number of devices and consequently switch is connected to Wireless LAN controller.

# Firewall (Hardware)

Dnes máme hardwarové firewally nové generace, které jsou vybaveny systémy jako Intrusion Detection System (IDS) a Intrusion Prevention System (IPS).

- IDS, detekuje útok a upozorní na něj něco jako když máte doma psa, který Vás svým štěkotem upozorní, že máte doma zloděje, ale už ho nezastaví. Nejsou přímo v síťovém provozu. Dělá si kopie síťového provozu.

- IPS útok detekuje a zároveň zablokuje, prevent the attack. Je přím osoučástí síťového provozu a provoz proudí přímo přes něj.
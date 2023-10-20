---
Title: Introduction to terminology in networks
Date: 2020-12-31
Category: Networks
Tags: networks, beginner
Slug: basics-terminology-networks
Authors: David
Summary: Learn the basics about networks through terminology which you will meet on every corner
Status: published
---

[TOC]

# Resources

My article is just rewritten form from articles below in my words, which I understand....

- **An Introduction to Networking Terminology, Interfaces, and Protocols** published on [digitalocean.com](https://www.digitalocean.com/community/tutorials/an-introduction-to-networking-terminology-interfaces-and-protocols)


# Local area network (LAN)

Lokální síť u Vás doma. Ethernetová - vytvořená pomocí kabelů.

# Wide area network (WAN)

Jedná se o Internet tam venku.

# Wireless local area network (WLAN)

Bezdrátová lokální síť.

# Network Address Translation (NAT)

Přeloží z privátní (lokální) IP adresu na public IP adresu

# MAC address (Media address control)

Jedná se o unikátní adresu, která je pevné spojená se síťovým zařízením (síťová karta). Jedná se o adresu používanou ve vrstvě 2 - data link.

Unikátní adresa je zařízení přiřazena výrobcem zařízení a nedá se změnit.

Adresa se skládá z 6-ti octetů nebo bytů. Obsahuje tedy celkem 48 bitů. A zapisuje se v hexadecimální soustavě.

Jak jsme si řekli, každé zařízení má svou unikátní adresu a v síti se tedy nemůže stát, že by dvě zařízení měli dvě stejné MAC adresy. Jedna adresa je ale speciální a to je **broadcast address**.

Broadcast address má tvar -> FF:FF:FF:FF:FF:FF

Broad cast adresa se používá když neznáme MAC adresu cílovéhé zařízení v takovém případě do požadavku k IP adrese připíšeme broadcast adresu, díky této adrese pošleme požadavek na všechny zařízení v síti a ozve se nám zařízení, které má požadovanou IP adresu.

# Communications types

## Unicast

One to one communication. One speaking one listening

## Broadcast

One to many. One speaking and everybody listening. It is little bit spammer beacuse it is sent you information also in case if you dont want to receive any.

With broadcast is a lot of problems.

## Multicast

One to many. Same as broadcast but multicast speaking just to who wants to listen. It means that I have register that I want to listen. If I dont let know to speaker that I want to listen then I dont receive any information. It works similar as when you subscribe some mail informations.

# OSI model

Open Systems Interconnection model

Tento model charakteruzije dílčí rozdělení síťových vrstev.

Pro lepčí zapamatování slouží tyto mnemotechnické pomůcky:

1. **A**ll **P**eople **S**leeping **T**hrough **N**etworking **D**on't **P**ass [CCNA course od David Bombal - Udemy.com]
1. **A**plikace potkala **P**rezentaci a **R**ealizovaly spolu **T**ransport **S**ítí spojením **F**yzickým. [wikipedie.org]

Jednotlivé vsrtvy jsou:

1. Physical layer (fyzická vrstva)
2. Data link layer (linková vrstva) - ARP
3. Network layer (síťová vrstva) - IP, DHCP, ARP, ICMP
4. Transport layer (transportní vrstva) - TCP, UDP
5. Session layer (relační vrstva)
6. Presentation layer (prezentační vrstva)
7. Application layer (aplikační vrstva) - HTTP, FTP, NTP, SSH, Telnet, SMTP, POP3


# TCP/IP model

Jedná se o model vycházející z OSI modelu, který je více zasazen do reality.

Tvoří ho pouze 5 vrstev. To je způsobeno tím, že tento model slučuje 3 vrstvy do jedné. A to konkrétně, redukuje tři OSI vrstvy aplikační, prezentační a relační na -> pouze jednu APLIKAČNÍ.

Výsledný model potom vypadá následovně dle CCNA course:

1. Physical - we send **bits** 1 or 0
2. Data link - we send **frames**, MAC addresses
3. Network  - we send **packets**, IP addresses
4. Transport - we send **segments**, TCP, UDP
5. Application

Jiné zdroje uvádějí zase tento model:

1. Physical Layer - Copper, Fiber Optic Cables, Wireless transmitter
1. Network Layer - Ethernet, ADSl, WiFi (předávání MAC address fyzických zařízení)
1. Internet Layer - IP, ARP, DHCP, ICMP (předávání IP adres)
1. Transport Layer- TCP, UDP (Způsob přenosu TCP -> spojitě, UDP –> nespojitě (videa))
1. Application Layer - HTTP, FTP, SMTP, POP3, SSH, Telnet, NTP


# DHCP (Dynamic Host Configuration Protocol) Server

Když se připojíme s naším počítačem do naší domácí sítě, tak náš počítač neví jakou má mít adresu a ani jakou adresu má náš router. Takže pošle tzv. Broadcast na tzv. Local Broadcast Address což je 255.255.255.255 a pokud máme zapnuté DHCP tak ten tento požadavek přijme a na základě něj nám přidělí Local IP Address z předdefinovaného DHCP Poolu což je rozsah lokálních address, které mohou být přiřazeny zařízením, které se připojují do naší lokální sítě. Díky toho nemusíme každému zařízení přiřazovat lokální IP adresu manuálně, ale je dynamicky a automaticky přiřazena díky DHCP serveru.
Dynamicky přiřazovaná adresa ovšem může být někdy problém, protože pokaždé kdy se stejné zařízení připojuje do naší sítě tak může dostat jinou IP adresu než mělo naposledy. Nicméně dá se nastavit, aby určité zařízení mělo přidělovánu stále stejnou adresu.

# CAM Table

Also known as **CONTENT ADDRESSABLE MEMORY**

or

**FORWARDING TABLE**

It is a table where are saved MAC (Media address control) addresses.

This table we can found in switches (layer 2 - data link). Many hosts can connect to switch. Every MAC address has certain number of interface by which can connect to switch.

Example of table:

|   MAC address |   Interface   |   TTL |
|   :---------: |   :-------:   |   :-: |
|   48:1B:34:ED:44:22 |   1   |   3 |
|   89:1B:34:ED:99:22 |   2   |   6 |
|   12:1C:34:ED:44:11 |   2   |   6 |
|   14:1F:14:EF:44:07 |   3   |   25 |

TTL - Time to live, it is a time how long the host will stay in table. The size of table is finite so when host exceed the time to live then the host is removed for table.

Table is saved in RAM of device. Device constantly refresh information in the table.

If we see two or more hosts (MAC addresses) connected to one interface we can supposed that these hosts are connected via additional switch.

# PDU

Protocol Data Unit

1. Physical - PDU is **bit** 1 or 0
2. Data link - PDU is **frame**
3. Network  - PDU is **packet**
4. Transport - PDU is **segment**
5. Application

# Protokoly


## Network layer

### IP

IPv4 format is:

x.x.x.x where x is 8-bits so total size is 32-bits

so 10.1.1.1 is equal in binary -> 00001010.00000001.00000001.00000001

Internet protokol - protokol síťové vrstvy
Connectionless protocol - it does not create a session it just send
Connection list protokol
Every packets sends by IP is independet, every packet can be send by different path.
Packets can be lost but TCP can resend losted packet.
No data recovery features.

IPv4 has hierarchical structure, we divide to two parts:
- network address portion (Network ID)
- host address portion (Host ID)

#### Network Address Portion (Network ID) and Host Address Portion (Host ID)

**Network ID**

Identifies certain network

Routers maintain routing tables that contains network

**Host ID**

Identifies certain endpoints on network as Laptop, TV, Phone, Printers, etc.


Analogy is that Nework ID is as Street name and Host ID is certain number of house. Routing protocol in networks search Network ID (name of street) and than ARP (Address resolution protocol) search for certain endpoint (certain house with certain number)

#### Address Classes

First three Class (A, B, C) are UNICAST Traffic

**Class A**

First octet binary of IPv4 starts with **0**, so range is from `0.0.0.0` to `127.255.255.255`. But `127` is reserved for loopback (localhost), (example `127.0.0.1`). And `0` is reserved for default network. These two number cannot be used at first position. SO real range which can be used is from `1.0.0.0` to `126.255.255.255`.

First octet of IP address is Networks.
The last three octer are Hosts.

So when we have IP address `126.168.1.100` - 126 is Network portion and it determines Class A and `168.1.100` is Host portion.

Example:

`10.0.0.0` is Network ID (Network address portion)

`10.1.2.3` is Host ID (Host address portion)

So we can have same host portion in diferrent Network - `10.1.1.1` and `12.1.1.1`, these two IP addresses has same host portion and it is allowed because these devices are in different networks. One is in network with Network ID 10 and the other device is in Network with ID 12. You can imagine as houses with same number but on different streets. So imagine you have two houses - one house with street number 111 a the second house with street number 111. But first house is on Oxford street and the second one is on Long avenue street. So there are two different houses and there is no any conflict.

**Class B**

First octet binary of IPv4 starts with **10** one and zero not ten (1000 0000), so range is from `128.0.0.0` to `191.255.255.255`.

First two octet of IP address is Networks.
The last two octet are Hosts.

So when we have IP address 130.168.1.100 - 130.168 is Networks, 130 -> Class B and Network portion, 168 -> Network portion and 1.100 is Host portion.

Example:

172.16.0.0 is Network ID
172.16.1.2 is Host ID

172.17.0.0 is Network ID
172.17.1.2 is Host ID

173.16.0.0 is Network ID
173.16.3.3 is Host ID

**Class C**

First octet binary of IPv4 starts with **110** one, one, zero not one hundred ten (1100 0000). Zero moved to third place. So range is from `192.0.0.0` to `223.255.255.255`. But `127` is reserved for loopback, (example `127.0.0.1`). And `0` is reserved for default network. These two number cannot be used at first position. SO real range which can be used is from `1.0.0.0` to `126.255.255.255`.

First three octet of IP address are Networks.
The last one octet are Hosts.

So when we have IP address 130.168.1.100 - 130.168 is Networks, 130 -> Class B and Network portion, 168 -> Network portion and 1.100 is Host portion.

**Class D**

is MULTICAST Traffic

First octet binary of IPv4 starts with **1110** one, one, one, zero (1110 0000). Zero moved to **fourth place** so range is from `224.0.0.0` to `239.255.255.255`.

Link Local Multitask - 224.0.0.X
OSPF - 239.1.1.1

OSPF (Open Shortest Path First) routing technology

**Class E**

is for reserved for future or experimental purposes (testing)

First octet binary of IPv4 starts with **1111** one, one, one, one (1111 0000). Zero moved to **fourth place** so range is from `240.0.0.0` to `255.255.255.255`.


Classes were replaced in 1993 by CIDR (Classless Inter-Domain Routing)

#### Directed Broadcast Address and Denial of Service Attacks (DoS)

First binary of host portion is fullfilled with ones as 1111 1111.
binary 1111 1111 = decimal 255

Example: 172.16.255.255 , all hosts on network 172.16.0.0 receive the broadcast

It is disable by default because of Denial of Service Attacks (DoS Attacks).

Denial of service attacks is done by from device which is destination of attack. This device send a broadcast to another network and all device will reply to that broadcast.

#### Local Broadcast Address

all octet are filled with binary 1s.

1111 1111.1111 1111.1111 1111.1111 1111 = 255.255.255.255

Your computer sends broadcast to DHCP server on that broadcast the DHCP server create your local IP Address.

#### Local Loopback Address

**IPv4**

it is address which start with 127, so it is IP address class A.
It is testing address. This address tests TCP/IP stack. It can be `127.0.0.1` or `127.127.127.127`.

Generally `127.X.X.X` is local loopback address, it is reserved for localhost. You can see it when you trying some web application. You've been trying it on localhost then you push to internet.

It makes 16 million address that can not be used and range of IPv4 is limited.

**IPv6**

local loopback address is ::1

#### Router's or switches loopback address

Is something different than local loopback address. It is 10.1.1.1/32

#### Subnet mask or netmask

It tells you which part of IPv4 address is for network and which part is for hosts.

So imagine that your IP address is `192.168.1.3`

- every bits equal to one (1) is for network.
- every bits equal to zero (0) is for host.

If we have subnet mast 255.0.0.0 in bits 11111111.00000000.00000000.00000000 -> than network is 192 and host portion is 168.1.3

If we have netmast 255.255.0.0 in bits 11111111.11111111.00000000.00000000 -> than network portion is 192.168 and host protion is 1.3

These is contiguous implemetation it means that we have ones in row and zeroes in row.

Theres is also discontiguous it can be like that 11111111.00011111.00000000.00000000 but this implementation you should not meet in reality fortunately.

##### CIDR - Class Inter-Domain Routing
With these concept you can meet CIDR when you have IP address written like that 192.168.1.3/16 -> /16 this means subnet characterization. It means 16 bits of ones = 255.255.0.0. 1111 1111 is 8 bits of ones in binary is equal to 255 in decimal.

Examples:

- 11111111.00000000.00000000.00000000 = /8
- 11111111.11111111.00000000.00000000 = /16
- 11111111.11111111.11111111.00000000 = /24
- 11111111.11111111.11111111.11111111 = /32 -> 4 * 8 bits = 32 bits

Joke is that in reality you can have this type of subnet:

255.255.224.0 -> 11111111.11111111.11100000.00000000

How to recognize what is network and host by this subnet ?

With bitwise AND


**For Network**

IP address: 192.168.33.12 (decimal)

11000000.10101000.00100001.00001100 (binary)

Netmast: 255.255.224.0 (decimal)

11111111.11111111.11100000.00000000 (binary)

–––––––––––––––––––––––––––––––––––––––––––––––––

11000000.10101000.00100001.00001100

&

11111111.11111111.11100000.00000000

–––––––––––––––––––––––––––––––––––––––––––––––––

11000000.10101000.00100000.00000000 (binary)

192.168.32.0 (decimal) –> Network prefix is 192.168.32.0/19 (16 + 3)


**For Host**

11000000.10101000.00100001.00001100 (192.168.)

&

NOT(11111111.11111111.11100000.00000000)

=

00000000.00000000.00011111.11111111 (13 bits)

–––––––––––––––––––––––––––––––––––––––––––––––––

00000000.00000000.00000001.00001100 (binary)

0.0.1.12 (decimal) –> Host prefix is 0.0.1.12

We have 8 + 5 bits = 13 bits of hosts -> 2^13 = 8192 available addresses for hosts




### ARP

Address Resolution Protocol

Hledá MAC adresu cílového zařízení, od kterého známe pouze IP adresu. Jinými slovy se na síti ptá jakou MAC Adresu má zařízení, které má tuto IP adresu ? Zařízení s hlednou IP adresou odpoví já mám tuto IP adresu a má MAC adresa je tato.

Počítače totiž většinou znají různé IP adresy, ale k nim neznají příslušné MAC adresy, abychom mohli zaslat plnohodnotný požadavek. Tak tento požadavek musí obsahovat, jak IP adresu tak MAC adresu, IP adresu známe, ale potřebujeme ji doplnit o MAC adresu to zjistíme právě pomocí ARP. Počítač neboli HOST se tedy učí MAC adresy na síti díky **ARP**.

V praxi ARP funguje takto, aby byl požadavek úplná musí mít IP adresu a MAC adresu, když ale MAC adresu nemáme tak se místo konkrétní MAC adresy do požadavku dá tzv. broadcast MAC adresa (FF:FF:FF:FF:FF:FF). Tato adresa udává, že se má požadavek zaslat na všechny hosty v síti. Jakmile tento ARP požadavek připutuje i k HOST, který má požadovanou cílovou IP adresu, tak zašle nazpět svou konkrétní MAC adresu. Tímto způsobem pomocí ARP získá počítač A, který byl zdrojem požadavku MAC adresu počítače B, který je cílem komunikace.

Informace o MAC adrese cíle se uloží do tzv ARP Cache. Při další komunikaci se tak už nezjišťuje jakou MAC adresu má cílový B počítač, protože tato informace už je v ARP počítače A uložena.

ARP Cache se s informací o MAC adrese maže po vypršení TTL, která se vypočítává na základě velikosti paměti RAM nebo když zařízení A vypneme.

Na svém pc se můžete podívat na ARP informace pomocí příkazů:

Windows/MacOS

```shell
arp -a
```

Linux

```shell
ip neighbour
```

## Transport layer

### TCP


Transmission control protocol - primární přenosový protokol

It sends SYN (synchornization info) to receiver. Than receiver sends back SYN AcK (synchronization Acknowledgment) to sender adn than sender send AcK (acknowledgement) to receiver back.

```
Transmitter     ->(SYN)->       receiver
transmitter     <-(SYN AcK)<-   receiver
transmitter     ->(AcK)->       receiver
```

It can resend lost (dropped), corrupted or misdirected packets from IP.
### UDP

User Datagram Protocol

## Application layer

### HTTP/HTTPS (Hypet Text Transfer Protocol)

### FTP/FTPS (File Transfer Protocol)


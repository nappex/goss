---
Title: Transcript of NSA operation orchestra in czech
Date: 2022-05-11
Category: Privacy, Networks
Tags: networks, privacy, talk
Slug: NSA-orchestra-transcript-cz
Authors: David
Summary: Czech translation of transcript to talk about NSA habits
Status: published
---

[TOC]

# Úvod
Tento text slouží jako český překlad přednášky NSA operation orchestra
z konference FOSDEM, která proběhla v roce 2014.

Originální přepis přednášky v anglickém jazyce nalezenete na těchto
stránkách [zde](https://nappex.github.io/myblog/NSA-orchestra-transcript-en).

## Základní informace k přednášce

NSA annual state report by Poul-Henning Kamp (FreeBSD vývojář) - FOSDEM 2014

odkazy na video:

* [youtube](https://www.youtube.com/watch?v=fwcl17Q0bpk)
* [vimeo](https://vimeo.com/86567061)
* [FOSDEM](https://ftp.fau.de/fosdem/2014/Janson/Sunday/NSA_operation_ORCHESTRA_Annual_Status_Report.webm)

odkaz na prezentaci:

* [Poul-Henning Kamp personal page](http://phk.freebsd.dk/pubs/FOSDEM_2014.pdf)


Přednáška se skládá z těchto částí, proto ji autor nazývá jako orchestr:

**Playlist spoiler**:

* Electric Light ORCHESTRA: Confusion

* ABBA: Money, Money, Money

* Backman Turner OVERDRIVE: Taking Care Of Business

* QUEEN: Bicycle Race

* Beastie BOYS: Sabotage

* PASADENA Roof Orchestra: Pennies From Heaven


# Rozhovor s Poul-Henning Kamp před přednáškou:

Poul-Henning Kamp bude mít přednášku s názvem
*NSA operation ORCHESTRA: Annual Status Report at FOSDEM 2014*

1. Q: Mohl byste se stručně představit?

    Jsem šest stop vysoký lidoop, který si vydělává děláním divných věcí
    na počítačích.
    Jsem v počítačové branži 30 let a v open source 29.
    Býval jsem jeden z hlavních vývojařů ve FreeBSD, nyní jsem ten
    člověk, který stojí za projektem Varnish HTTP accelerator.

2. Q: O čem přesně bude vaše přednáška?

    A:

    Má přednáška je o vztahu NSA - FOSS.

    Myslím si, že jej potřebujeme přehodnotit.

3. Q: Co vás k tomuto tématu přivedlo, proč se vlastně o něj zajímáte?
    Proč je pro vás tak důležité o tomto tématu přednášet?

    A:

    Inspirací pro mě je odhalení, které udělal Edward Snowden.
    Mezitímco se hlavně zaměřili na širokou veřejnost a politiky,
    se zde objevuje zcela odlišné sdělení pro IT svět a obzvláště pro
    FOSS komunitu, ale většině lidí to uniká.

4. Q: Mohl byste objasnit hlavní sdělení, které chcete přednáškou předat?
    Kdyby si lidé měli odnést jednu věc z vaší přednášky,
    co by to mělo být?

    A:

    “Komu věříte a proč...”

5. Q: V co doufáte, že dosáhnete svou přednáškou? Co očekáváte?

    A:

    Doufám, že se lidé budou smát a přemýšlet.

6. Q: Jaká je role FOSS v této době sledování NSA a dalších pochybných agentur?
     Jsme schopni bojovat se souřasnou krizí soukromí s pomocí FOSS?

    A:

    Tohle jsou velmi dobré otázky, doufám, že má přednáška inspiruje lidi, aby
    přemýšleli a zkoumali důkazy k nalezení odpovědí.

7. Q: Užil jste si předchozí FOSDEM konferenci?

    A:

    Ne, nikdy jsem ještě na FOSDEM konferenci nebyl.


# Český přepis přednášky NSA operation ORCHESTRA: Annual Status Report
**Moderátor:**

Děkuji vám, že jste se k nám připojili. Nyní bude Poul-Henning Kamp,
také možná lépe známého pod přezdívkou phk, a jeho přednášku na téma
annual status report on NSA operation orchestra.
Vítejte.


## Přednáška
**Poul-Henning Kamp:**
Děkuji.

### Úvod - O co se jedná?
Před pár lety se objevila nová věc, která mě přinutila si sednout na židli
a přemýšlet. Nejspíše to není ta věc nad kterou teď přemýšlíte, že FBI odhalila
milostnou aféru ředitele CIA, tím že vyměnila tuto telekomunikaci.
Býti bezpečnostním výzkumníkem, což není něco, čím bych se normálně nazýval,
znamená umět pracovat s představivostí. V situacích jako je tato si musíte sednout
a pokusit se přemýšlet stejně jako mysl těch, kteří to provedli.

Později jsme získali odhalení od Edwarda Snowdena a já si sednul a
přemýšlel co bych dělal kdybych měl rozpočet jeden bilion dolarů, pověření
a příkaz nasbírat tolik komunikace, kolik je jen možné.

### Operation ORCHESTRA

Pak před týdnem jsem dostal email of Filipa, nějaký chlápek z FOSDEMu,
v tomto znění:

"Potřebuji nějakého přednášejícího, co děláš příští týden?"

Protože dlužím Filipovi hodně laskavostí, řekl jsem:

"můžu udělat přednášku"

a tak jsem si sedl a vytvořil dnešní prezentaci.

Základní předpoklad k mé přednášce je, že byste si měli představit juniorního
pracovníka NSA přijíždějícího do Bruselu, aby poskytl NATO aktuální informace
o jednom z programů NSA a namísto toho tam skončí, protože je Američan.

Kdybych měl plno času, udělal bych tu část s černými vlasy, slunečními brýlemi
a všeho toho, ale budete si to muset pouze představit.

Tohle je Operace "Orchestr" (pozn. fiktivní tajná operace NSA vymyšlená autorem
přednášky). Jsem si jist, že žádné informace z této operace, která je samozřejmě
v nejvyšším stupni utajení, neopustí tuto místnost.

### ORCHESTRA operation na první pohled

Základním úkolem Operace "orchestra" je redukovat náklady při sběru informací.
Organizace NSA má ve svých regulích, které řídí jejich financování, sbírej
co nejvíce infromací je možné, ale jako zodpovědná vládní organize se je
snažíme sbírat s co největší hospodárností.

Operace "orchestra" je tedy o redukování NSA nákladů při sběru informací.
Veškerá činnost musí být přes vedení operace.
Nejsou dovoleny žádné tajné operace typu
"black-ops". Black ops jsou operace, kde se porušují zákony.
Nemáme žádnou speciální autorizaci, nemáme žádného 007 s povolením
odposlouchávat nebo něco podobného.

A možnost nebo způsob, jak to udělat je, že se pokusíme zlikvidovat činnost,
která zabraňuje oslabování šifrování. Snažíme se naopak umožnit přístup
k informacím a zároveň frustrovat hráče, kteří se nám pokoušejí to ztížit
(např. kvalitním šifrováním).

### Historie
Něco k historii...
Ve skutečnosti se jedná o velmi starý program.
Začal velmi brzy po úniku Inter-Netu.

Internet byl vymyšlen jako projekt pro armádu, úmyslem nebylo, aby jej
začala používat babička, teroristi apod. Velkým problémem internetu
narozdíl od telekomunikační sítě tak jak ji známe je, že do něj můžete zapojit
cokoliv aniž byste k tomu nejdříve dostali nějaké povolení.
Lidé si mohou stavět své vlastní počítače a zapojit si je do sítě.
To jste nemohli udělat se starou telekomunikační sítí.
To jste šli do FCC (Federal Communications Commission) a dostali jste
malou nálepku a všechny další náležitosti.

Najednou jsme v této neregulované síti. A v této síti je podstatně více
účastníků. Kdysi jsme si povídali jenom s AT&T,
která tak mohla odposlouchávat kohokoliv. A také to ve velkém dělali.
Nyní ale máme milióny internetových sítí a mnoho z nich je v zahraničí.
Nemůžeme se vypořádat se všemi z nich. Musíme nalézt škálovatelní metody,
které budou schopny se s tím vypořádat.
A náš pokus zkoušet manipulovat vnější protokoly na místo protokolů tcp/ip,
bohužel selhal. To by pokračovalo v modelech spojované komunikace telefonní
sítě, ale to nefungovalo. Bylo to opravdu velmi špatné.

### Původ Orchestru

Zdrojem je pracovní skupina deep thought (hluboké myšlenky?),
která přišla s těmito nápady ohledně snahy získat kontrolu
nad klíčovými pákovými body (key leverage points) na internetu.
Stále zde existují místa, kde se věci skutečně dějí.

Ovlivňovat průběh k naší výhodě and identifikovat klíčové osoby,
kde levně můžeme získat velký účinek.

### ABBA operation
Jedna z nových věcí v operaci orchestr je něco, čemu říkáme ABBA operace.

A tohle je velice starý problém. Nějaký chytrý vynálezce vynalezne něco,
čím nám více zkomplikuje naše životy.

My tohle nechceme.
Takže co budeme dělat?

#### Stará škola
Způsob, kterým bychom tohle udělali by byl, že bychom se jej snažili uplatit,
udělat s ním pracovní poměr nebo něco podobného.
Zařadili bychom jeho patent mezi utajované.
Takže by měl sice patent, ale nemohl by ho nikomu ukázat.
V některých případech můžeme lidi zavázat mlčenlivostí, s ohledem
na národní bezpečnost a tak dále. Prezident si s váma podá ruku a všechny
tyhle věci.
Ale do toho je zahrnuto hodě papírování a zanechává to za vámi plno stop.
Také do toho musíte zapojit mnoho lidí. Jedná se tedy o druh velmi dráhého
procesu.

#### Nová škola
Nalezli jsme nový způsob, jak tohle dělat.
Využíváme surový trh kapitalismu.
Jendoduše házíme peníze na problém.

Nalezneme nějaký start-up, který nám bude způsobovat problémy.
Samozřejmě čteme HackerNews a podobné noviny.

Zde je rizikový kapitalista, který start-up kontaktuje se slovy:
"Oh, viděl jsem vás v HackerNews můžu za vámi někdy zaskočit?"

Tenhle chlápek se zastaví, ukecává je a zve je ven na luxusní večeře, kde
upustí 10k dolarů, aby dostali lepší místa nebo něco podobného.
Vše probíhá v duchu - o všem mě informujte, jak vám můžeme pomoci apod.

Nyní když už ví, co chystali, přijde domů a začneme hledat dobrý patent.

Když máme štěstí, hledaný patent už je u jednoho z přátel od NSA a
natáhl by linku k IBM a k jejich patentovým právníkům.
Vy byste se měli na tyto chlapíky podívat, protože jsou strašlivě blízko
vašemu patentu.

Ne méně jako IBM, vyšleme pár patentových právníků s mnoha patenty
a start-up bude mrtev.
Velmi často dokonce zavolají zpět rizikovému podnikateli se slovy:
"Oh, omlouváme se..."
Takže dostaneme zpětnou vazbu a víme, že to ukončili.
To je úžásné, to je jako 30k dolarů.

Jestliže patent není v něčem, co nazýváme správné ruce.
Budeme se zjevně snažit nalézt lepší patent nebo jej zkusíme převést.
If the patent is not in, what we call good hands.
Zde existují nějaké patentové společnosti, které spolupracují
a patent odkoupí. Pak jej mohou používat pod naším jménem.

### Operace PASADENA
Jedná se o velmi výhodný proces.
Využili jsme nějaké podobnosti k vyřešení dalšího starého problému.
My máme totiž problém s lidmi, kteří pro nás pracují v odlišných situacích
a my je za jejich práci potřebujeme odměnit.

A tohle býval druh nějaké podvodné operace,
víte, jakože najednou by vyhráli v loterii.
Nějaký vzdálený příbuzný by jim zanechal majetek.
Nemůžeme se omluvit za "Nigerian scam", ale to je typ toho jak to začalo.
Lidé dostávají užásné pracovní nabídky. Někdy i nové identity
a tenhle typ možností.
Vy musíte ohnout mnoho pravidel, aby jste byli schopni tohle vše udělat.
Je velmi těžké tyto stopy skrýt a Google to učinil neuvěřitelně obtížné.
To je něco jako:
"Oh, vy jste náhle ztratili vzdáleného příbuzného, jaktože nemůžeme k této
osobě najít vůběc žádné stopy na googlu.
To by dopadlo s podivením: "hmm?!"

Ne. Dnes je to daleko jednodušší.
"Šéfe, končím tady."
Poté si udělá start-up, najde rizikového podnikatele, který vyklopí pár miliónů
do start-upu.
A potom sedí a prochází internet pár roků nebo cokoliv jiného co chce dělat.
A je to!
Kancelářská práce je zcela běžná, existuje na to i daňový formulář.
To je vlastně jedna z daní, díky kterým jsem nakonec vytvořil společnost,
která fungovala.

To je přesně ono, Rubín.
Tohle je způsob, jak dostat peníze k našim cílům.
Tohle je způsob, jak můžeme přesunout peníze do lidí, po kterých chceme,
aby něco dělali.

### OVERDRIVE aktivity
Na druhém konci žebříčku, mluvíme-li ohledně peněz, máme něco, čemu říkáme
overdrive aktivity (aktivity rychloběhu).
Jde o ovlivňování obchodních rozhodnutí.

Využijeme NSA kontrakty na poměrně velké nákupy IT služeb.
Můžeme si sami do značné míry rozhodnout, komu zakázku dáme.
Nejedná se o férové nakupování, když se jedná o národní bezpečnost.
Dobrá věc na smluvním právu je, že sním můžete dělat cokoliv.
Nemůže být přímo nezákonný,
nemůžete mít smlouvu na něčí zabití, ale můžete smluvně udělat cokoliv
co je v mezích zákona.

Jedná se o velmi dobrý mechanismus, jak řešit velké problémy.
Špatnou zprávou jsou obvykle velcí hráči, kde jsou právníci, to je pak
trochu drahé.
Můžou být nějaké cíle k zaměření, ale jedná se o dobrý způsob, jak
řešit problémy a jedná se vlastně o způsob, jak jsme vyřešili problém
s aplikací Skype.

#### OVERDRIVE: příklad programu Skype
Skype byl program na způsob peer-to-peer, kde byl šifrován video i zvuk.
Nepoužívali standardní protokoly. Byli mimo FCC. My nemůžeme říct
jen tak "tohle je nelegální!" a zakazát je.
Nejedná se o open-source. Ani to nekoupili přes naše usílí o jejich nápravu.
Je populární u nezávislých herců a skupin na lidská práva
například v Bělorusku.
Také je velmi oblíben politickými hnutí, která jsou v nepřízni
politického směru USA na blízkém východě (střední východ).
Samozřejmostí je používání teroristy, tím jsem si naprosto jisti.

Nejprve jsme se spolupracovali s eBay, která je velmi významný přítel NSA.
Po menším přemýšlení a schválení zpravodajskou službou pro nás nakonec
Skype koupili.
Bohužel to zpackali.
Koupili pouze přístup do Skype.
Nezískali zdrojové kódy, ani kontrolu nad sítí.
Něco jako "Achjoo".

Není zřejmé proč jejich právníci nebyli instruování, nicméně jsme nezískali
co jsme chtěli.
Takže jsme to museli zkusit znova, ale nemůžeme to udělat,
když tady sedí eBay.
eBay musí Skype znovu prodat ve ztrátě a už není tak docela dobrý přítel NSA.
My neustále pracujeme na těchto vzájemných vztazích.
My dostali Microsoft, který nám to místo toho nakoupí.
A nyní dostali vše, co potřebujeme.
Nyní Microsoft změnil architekturu Skypu na centralizovanou.
Celá komunikace je nyní vedena přes Microsoft servery, velmi výhodné,
bude zde dešifrována když to bude potřeba.
Byla to velmi nákladná operace, ale bylo to nezbytné udělat.
Nemohli jsme mít komunikující lidi mimo naše soudní pravomoce.

#### OVERDRIVE: Summary
Je to opravdu velké kladivo.
Vyžaduje to podpisy, které jsou velmi vysoko nad mou mzdou,
ale jedná se o velmi dobrý způsob, jak dělat věci.
A jedna ze zajímavých věcí, které se zde vyskytují jsou velcí hráči.
Bez ohledu na to co udělají, je to vynikající.
"Sice tomu nerozumíme, ale je to vynikající."
"Nedává to smysl, ale je to vynikající, protože on je génius, víme to."
Můžete dělat skutečně divné věci tímto způsobem, zcela otevřeně
a nikdo ani nemrkne okem. Máme to rádi.

### QUEEN activities
Pak zde máme Queen aktivity a na tomhle pracujeme hodně.
Open-source a internet jako takový je aktivita založena na konsenzu,
což znamená, že se nich může podílet kdokoliv.
Nikdo nemá speciální pravomoce.
Mohou se zde vyskytovat někteří lid, kteří jsou první mezi rovnými a podobné
typy výmyslů, ale není to jako, že je zde někdo,
kdo má ve své zadní kapse právní listinu a může říct:
Já to říkám protože tento zákon číslo bla.

Jedná se o velmi hrubý konsenzus a fungující kód,
s výjimkou současných dnů, kdy je to spíše
o velmi dlouhých, komplikovaných standardů, než o více fungujícím kódu.
Objevuje se zde ve velkém také mezinárodní součinnost, což znamená,
že se nemůžete odvolávat na lidové vlastenectví, nemůžete říct:
"pro dobro národa, musíš tohle...". Tohle moc nefunguje.
Také se jedná o velmi významnou masu talentů, která je ale problém,
protože odhaluje naše věci (nekalosti).

Teoreticky tohle vše spadá pod státní tajemství,
protože v mnoha případech se jedná o zahraniční vztahy,
ale
because these are foreign relations in many cases,
ale "Foggy Bottom" (přízemní mlha, inverze, jméno městské části Washington DC)
není natolik technicky zdatný když na to přijde.
Diplomaté jsou naprosto nevystopovatelní díky nastavení jako IETF.
Když vstoupíte s kravatou mohou se na vás dívat divně.
A našimi cíli nejsou .....,
oni smí být v rozporu s cíli státních tajemství.
Do toho všeho jsou zde zahrnutí další hráči (jako DoC, NIST, DoD, FBI, CIA),
s kterými nemusíme nutně ve všem souhlasit.
Jedná se trochu o komplikovaný prostor.

Takže to co děláme je, že máme páky na naše existující zdroje.
Máme webové zdroje vryté s přáteli NSA.
Máme svobodné agenty. Lidé, kteří něco provedou až po zdravé úvaze.
A taky máme, co my nazýváme bezelstné dobrovolníky,
kteří mohou být manipulováni tak, aby splnili naše nabídky
bez toho aniž bychom jim za to něco zaplatili.
To je velmi dobré, protože zde neexistuje žádná vystopovatelnost.
Takže co mi děláme je, že my rozmístíme velmi pečlivě navrhnuté
přednáškové místa. Nečestně pokud můžeme.
Máme oddělení, které má na svých dveřích nápis,
na kterém stojí "PSYOPS pro nerdy"
Myšlenkou je směrovat diskuzi na těchto fórech k nebo od
podrobných témat, tam kam chceme.
Obecně se velmi často nerušujeme budovaný konsenzus,
která jde proti našim účelům.

#### QUEEN: úspěšné příklady SSC (Self Signed Certificates)
Certifikáty podepsané sám sebou, které jsou v prohlížečích
to je velmi dobrý příklad.
Certifikát podepsaný sám sebou je certifikát, který zaručuje, že se jedná o mě.
Ve skutečnosti mě nepotrzuje jako nevinnost světa,
ale pokud mám takový certifikát na svém webovém serveru, můžete pomocí
svého prohlížeče vytvořit tajný kanál s mým serverem.

Tohle pro nás není příliš dobré, protože budeme muset utratit velmi
nákladné zdroje na odšifrování kdykoliv to bude potřeba.
Ale lidi tohle mohou dělat prakticky zadarmo.
Jediná důvod proč to lidi nedělají je, že to po nich opravdu nechceme.
Bylo by nápadné kdyby to bylo jak výchozí nastavení na Apache, vždy
jen udělej Certifikát podepsaný sám sebou, pokud se nejedná o pravý certifikát.

Už jsme strávili hodně času v této místnosti.
A na některých přednáškových místech, které bez pochyby neubližují,
to může vypadat takto:
"Oh, ale utajení bez ověření je zbytečné, mohli byste mluvit s NSA
a ani byste o tom nevěděli!"

Tenhle máme opravdu rádi, jsem na tento opravdu pyšní.
"To dává falešný pocit bezpečí!"

To hlavní ohledně těchto věcí je, že pokud je opatrně upravíte,
promlouvají pak k lidksé politické náklonosti.
Pokud jsou lidé lehce paranoidní, aby s tím začali,
což mnoho lidí, ktěří dělají v IT bezpečnosti jsou.
Pak to je to něco jako:
"Jasně, ne to bych nedělal, pokud nemám 2048-bit obrněnou garanci toho,
že vím kdo je na druhém konci, potom to není dobré."

Pokud se pokoušíte v dnešní době dostat na webový server, který má sám sobě
podepsaný certifikát, dostanete tyhle škaredé upozornění, kde je:
"Oh, ty bys neměl tohle dělat, tohle je nebezpečné. Jsi si opravdu jistý,
že víš co děláš a že máš na tohle PhD titul?"
A čím více tlačítek zmáčknete, tím více varování byste měli dostat.
Od této chvíle se babičky a teroristé internetu úplně vyhýbají.
A vtomhle je jedna věc, někteří z našich předchůců, které opravdu
milujeme za to, že obstarali certifikáty x.509, to bylo opravdu úžasné.
Pokoušeli jste se někdy podívat na všechny ty věci, které jsou
v certifikátu, nikdo z toho nerozumí ani slovu.
Většinou to vypadá nějak takto:
"Ne, nerozumím tomu, jdu odtud pryč."

Tohle je velmi dobrý příklad toho, jak program QUEEN funguje.
Jednoduše přimějte lidi aby nedělali věci, když na ně nezaměří svou pozornost.

#### QUEEN úspěchy
Oblkopen dalšími věcmi, které jsme udělali v QUEEN je, že zde není
žádný multihomig
(*poznámka překladatele*: síť, která je přípojena k více ISP najednou,
když jeden ISP vypadne přepne se na jiného) bez možnosti vlasnit své vlastní
AS čísla. (AS - autonomní systém. Vlastní autonomní systém mají typicky ISP,
datacentra nebo jiné společnosti s rozsáhlou počítačovou sítí)
Což znamená, že my můžeme vždy najít, kudy jde veškerý váš provoz, protože vždy
teče přes vašeho ISP (internetového poskytovatele).
Nepotřebujeme vás sledovat kolem sedmi odlišných stran apod.

Také zde neexistuje, žádné flow routing v IP verzi 6
Když bylo IPv6 předloženo byl v něm velmi chytrý návrh, který říkal,
že bychom neměli zabouchnout komunikující adresy ve všech paketech,
že to budeme dělat pouze v prvním paketu.
Poté dostaneme malé plovoucí (desetinné) číslo,
které řekne, že všechny tyhle pakety plují tímto směrem
And then we'll get a small flow number,
that says all the packets in this flow go that direction,
ale to by ovšem pro nás bylo velmi nepraktické,
protože bychom museli sledovat všechny tyhle plovoucí čísla najednou.
Když máte IP adresu v jednom balíčku, můžete prostě jen sebrat všechny
ty pakety a máte všechny informace, které potřebuje od všech paketů
za celou dobu.
Nepotřebujete mít všechny plovoucí stavy a na konci znát co každý tok znamená.
To byl veliký úspěch - ne že by IPv6 byla, ale že pro nás už
nepředstavuje velký problém.
Moudré schromážďování, ale připraveni IPv6 vystřelit.
Také jsme zde vytvořili prostředí, kde prakticky není možné kompatibilně
poslat zašifrovaný email.
Tam kde je na obou koncích šifrování nutné použít stejný program
jsou všichni potopeni, protože v opačném případě to nebude fungovat
a výsledek tak nebude nikdy použitelný.

A také se nám dařilo zpozdit službu Voice over IP (VoIP), dokud se nestala
příhoda se Skypem.
Voice over IP je velký problém,
protože nemůžete automaticky hledat skrze hlasová data.
Je daleko snažší, když si lidé navzájem posílají emaily,
hledáte prostě jen určité patterny apod.

Takže tohle jsou naše velmi velké úspěchy v QUEEN programu.

#### QUEEN nedávná práce
Nyní pracujeme na standardu HTTP 2.0.
Chtějí, aby tam bylo velké zastoupení a všechno bylo TLS,
které by mohlo být nepohodlné.
Pokoušíme se nasměrovat špatným směrem a tím se pokusit celý proces zhatit.
Mám tím na mysli, koukněte se na dobrou stránku věci, pokud bychom je přivedli
do TLS, dostali bychom všechny root certifikačních autorit,
které by dělali práci za nás.
Takže máme všechny klíče pokud přijde na to, že uděláme
man in the middle či jiné podobné věci.
Pokud to je možné raději, zůstaneme zašifrovaní.
A jako fallback se je snažíme natlačit do nějakých špatně navržených protokolů.
Bohužel jeden z nich zdá se býti už odhalen, ale pracujeme na vydání nového.
To už není práce našeho oddělení
my se pouze snažíme natlačit lidi do druhu věci.

#### QUEEN metody
Metody, které používáme jsou obyčejný strach, nejistota a pochybnosti.
Musíte být nejistí a pochybovační.
Hraní si s tématem GPL versus BSD karta stále funguje, je to úžasné.
To je už jako: "Oni se tímto tématem snad nikdy neunaví?"
Ano, to je opravdu užasný kryptografický kód,
"já vím, ale nemůžeme jej použít z licenčních důvodů."

Diskuse typu bikeshed jsou úžasné. (*Poznámka*: bikeshed znamená nikdy
nekončící diskuse, termín bikeshed
vymyslel sám phk jako reakci na diskusi okolo funkce "sleep",
[zde](http://phk.freebsd.dk/sagas/bikeshed/#the-bikshed-email) je
k tomu celý článek),
Někdy stačí pouze jeden jediný email od neznámé osoby, který je
schopen na měsíce vykolejit práci celého open-source projektu.

A můžeme nasát ohromné množství šířky vlnového pásma kryptografů
s falešnými návrhy na kryptografii.
Pošlete návrh, který říká:
"Oh, vymyslel jsem tento úžasný způsob,
jak to udělat"
Ostatní stráví měsíc přehrabováním se v tomto návrhu,
namísto dělání skutečné (prospěšné) práce.

#### QUEEN nedávná práce
Takže takhle to nějak ve světě funguje.
Jedna z oblastí na kterou se v současné chvíli změřujeme je tlak na
změnu používaní certifikátu modelu PKI na model DANE, který schvaluje
vaše certifikáty skrze DNS.
A tohle je cena zaplacena za to, že si lidé uvědomili skutečnost, že
všichni mají kompromitovaný CA/PKI systém.
Co mám na mysli, je že, pokud se podívate do svého prohlížeče naleznete
tam asi 200 schválených CA's (certifikačních autorit) a polovina z nich
je vlastněna neznámými službami napříč celým světem.
V tuto chvíli je to už trochu zbytečné.

Lidé se tak chtěli přesunout do něčeho co nazýváme DANE protokol.
Myšlenkou zde je validace certifikátu za použití DNSSEC.
Takže máte tento podpis v root zóně a ten podepisuje další klíč, a ten
podepisuje další, a ten podepisuje další, který říká, že můj
server používá tento certifikát.
Nyní tomu můžete věřit, věříte pouze jednomu klíči, že?
Takže výhodou modelu PKI/CA je, že máme dneska přístup, ale DANE projekt
by tohle velmi rád, protože nyní věříme pouze jednomu jedinému certifikátu.
"Šťouch, šťouch, mrk, mrk, řekl on záměrně .... "

A dokonce nejelpší část toho všeho je, že nerozumím tomu jak tito
údajně profesionálové mohou přehlédnout toto:

DNS je jen UDP.

Je daleko snažší udělat útok typu "packet-race" s UDP než s protokolem TCP.
Prostě pošlou DNS požadavek a vy nebudete první, hotovo.

### BOYS - speciální dar
To je další velmi zajímavý program na kterém teď děláme.
Doopravdy je to vlastně inspirováno "field accident".
Kdy jsme museli vystěhovat vysoce rizikový a vysoce kvalitní zdroj
a neměli k tomu žádné vhodné vybavení poblíž jeho polohy.
Vytvořili jsem z něj tedy nezávislého dodavatele.

Příběh byl něco jako unavený šéfem a nějaká špatná politika společnosti,
a tak dále ... Jsem zaseknutý nemám se, kde posouvat...
Měl jsem štěstí, že jsem našel nějaké zákazníky a tak dále.
Zatímco si jen tak sedí, tak strávil nějaký čas na nějakých open source
projektech... Musel něco dělat.
Všimnul si nějakých příložetostí k přípravným pracem.

Většina open-source projektů je založena na důvěře.

Není v nich oficiální kontrola,

není v nich  kontrola kontrola životpisů,

ani kontrola, zda jste opravdu ten, za koho se vydáváte.

V praxi to často vypadá následovně:
"Oh, jsem týpek z Ulaanbaataru a zde máma pro vás nějaké patche."

Pokud posíláte dobré patche po několik let, lidé vám začnou důvěřovat,
a přestanou kontrolovat vaše patche a nakonec vám mohou dát i "commit bit",
takže můžete přidat vaše změny kódu rovnou sami, protože je to mnohem snažší.
Jedná se o úžasné prostředí, kde lidé mohou přijít a nikdo o vás
neví jestli jste ve skutečnosti pes nebo NSA agent.
Tímto způsobem můžete nejen sbírat informace o projektu přímo ze vnitř,
ale jakmile si vybudujete důvěru můžete začít přímo ovlivňovat jejich kód.

Získat právě zde pochopení je pro nás velmi snadné, představte si to jako:
"Oh ano, víš já jsem sys-admin této neziskové věci tak dlouho, dokud
emaily fungují a tiskárny tisknou."
Tohle celé je takové šumění, mám tím na mysli, že si tu tak sedím sedm hodin
denně a nedělám ani hovno.
"Ok, cool"
Je tady nějaký chlapík, je to jeho čas.. dodává dobrý kód,
my jsme s tím v pohodě.
Jedna z věcí, které tímto zjistíme je,
že by to tak ve skutečnosti mohlo fungovat.
Ve skutečnosti je tohle jeden z našich lidí.
On sedí někde v přední části nějakého obchodu, aby pro nás zastavil,
co já vím, opadávání dubového listí přes cokoliv vás může napadnout
a celé to je jako ta nezisková věc před chvílí.
Vlastně to je áš soused, který sedí v té přední části toho obchodu.
A potom vždy je potřeba někdo, kdo zajistí aby jim počítače, které mají
fungovaly v této malé tajné pasti.
A potřebujeme mít internet a stůl pro našeho člověka.
Takže to je velmi pohodlné.
Šéfové mohou vlastně prohlašovat něco jako:

"Oh, děláme kooperativní práci a šetříme tím peníze" apod.

Je to opravdu velmi dobré.

Samozřejmě nemůžete přijít a začít přidávat zřejmé zranitelnosti do kódu.

Lidé by si tohohle všimli. Musí to být více záludné.

Programovací chyby.
Znáte je jako nepozornost, středníky a tak dále,
you know the careless, semicolon yade, yade serial one based error,
všechny tyhle klasiky.
Nemůžete je dělat přímo vy, to by bylo nebezpečné.
Nejlepší je říct:

"Oh, dostal jsem tuto opravu na kód a mrknul jsem na to a vypadá to OK."

A potom to začleníte do kódu.

Lidé si všimnou, když váš kód stojí za nic, ale jestliže přijmete opravu
od někoho jiného, která nění jak se říká úplně podle standardu.
Všichni můžou mít špatný den.

Obecně je těžší pochopit kód, jehož kritické části jsou úmyslně zamlžovány.
Usnadňuje to následně vytvořit skoro cokoliv co bylo vašim záměrem.

Další mimořádně úžasnou praxí pro kryptograficky citlivé věci je vždy vytvoření
klamavá či mylné dokumentace. Dále zavádějící výchozí hodnoty,
které zapřičiní, že se nedějí věci, které lidé očekávají.

Nemusí se nutně jednat o core code, nemusí to být kernel operačního systému.
Ve FreeBSD je 20 000 balíčků softwaru.
Jsou zde používáné buildy.
Vyskytují se zde nějaké patche, které jsou ptořebné pro FreeBSD a tak dále,
ok vybuildi to a máte použitelný balíček.
Nikdo se nikdy na ty patche ani nepodívá.
Kdokoliv kdy portoval tenhle kus softwaru dělající tyhle patche, ví
že to akorát zabalí a je to hotovo. Nikdo to nikdy nezkontroloval.
Možná, když se nastavuje něco jako "setuid" program, tak někdo
na to mrkne, ale obecně se nikdo nikdy na tyhle patche
ve FreeBSD kolekci nepodíval.

A měli by je kontrolovat!

Tohle je náš plakátový chlapec.
Generator náhodných čísel v Debianu.
Tohle je opravdu nádherně provedeno.
Je tady chlápek co pošle sadu patchů, však víte.
Program Valgrind sice dostává stížnosti,
ale já nevidím nic rozumného co by jsi měl jen tak smazat.
A takhle to udělali
Takže po dobu dvou let, všechny debiany měly mizerný generátor
náhodných čísel, který umožnoval brute-force SSL klíčů a takovéto věci.
Hotovo.

Tady skončíme velmi dobrým bonusem.
OpenSSL je korunovační klenot.
OpenSSL je standardní knihovnou, pokud chcete pracovat s kryptografii.
Přimět SSL aby pracovalo proti všem prohlížečům a všem těmto věcem,
bez použití OpenSSL je velmi složité.
Přečtení manuálů a zdrojové kódu OpenSSL není složité,
to se velmi blíží něčemu, co můžeme nazvat jako téměř nemožné.
Má to něco okolo 300 000 řádků kódu.
Takže vám přeji mnoho štěstí s přečtením.
Dokumentace je nedostatečná až zavádějící.
Výchozí stavy jsou ošidné či zavádějící, nedělají co si myslítě, že dělají.
Nemáte představu kolik tohle ušetřilo peněz ve sběru dat.

### Operation ORCHESTRA současný stav
Takže celkový stav operace orchestra je obrovský úspěch,
utratili jsme méně než třetinu procenta rozpočtu NSA.
To pravděpodobně stálo náklady na sběr okolo 50%.
Tohle drží většinu internetu ve formě plain textu.
It's kept most of the Internet in plaintext.
A nikdy nebyl odkryt.
Byl to Snowden, který nemá vůbec žádné papíry k Orchestře.
Tohle si nepřečtete v Guardianu, protože je to vše
pohřbeno v nudných odděleních.

Operace OVERDRIVE je o nákupech.

BOYS je správa příslušenství či vybavení.

ABBA a Pasadena je personální, něměl přístup k ničemu z toho.

Děkuji!

### Závěrečná řeč
Běžnou reakcí open-source prostředí na Snowdenovo odhalení, je:

"Potřebujeme zesílit protokoly. Zajistit, že SSL bude všude."

A můj názor je, že tohle míjí hlavní smysl toho všeho.
Věci, které byli doposud publikovány ve Snowdenových dokumentech,
jsou věci, které může pochopit široká veřejnost přečtením si jich v novinách.
Věci, které by nás zajímaly ještě nebyli publikovány a nejspíše ani nikdy nebudou.
Přidávání dalších pokusů ke většímu zvýšení šifrování s největší pravděpodobností
povede k tomu, že budeme mít více pokaženého šifrování na internetu.
Nejedná se o technický problém, jedná se o politický problém.
To musí bát vyřešeno politickou vůlí.
Mám na mysli najděte politiky ve své zemi, kteří mohou pochopit tento
problém a ujistěte se, že tomu opravdu rozumí.
Pokud njste schopni takové politiky najít, tak sežeňte politiky, kteří tomu rozumí.
Politická vůle je obnovitelný zdroj, použijte svou tužku, když budete volit
nebo budete voleni.
Jedná se o budoucnost společnosti našich dětí a našich pradětí na kterou se díváme.
A my jsme ti chlápci, kterým tak trochu ujiždí loď.

## Q&A SECTION

Teď je prostor na vaše dotazy, pokud by někdo chtěl.
Položíme otázky a potom pracovníci FOSDEM provedou závěrečnou řeč.
Nechoďte tedy prosím pryč.

Mohl bych požádat všechny co odcházejí aby nerušili, probíhá zde sekce Q&A.

1. **Question**: Takže největším bezpečnostním únikem pro OpenSSL,
    je vlastně případ jejich dokumentace a všech těhle věcí,
    protože lidé obecně k tomu přistupují se slovy:
    "Raděj budu něco programovat"?

    **Answer:**

    Ano. Mám na mysli OpenSSL je katastrofa v mých očích.
    Měl by být vyhozen a začít znova od startovní čáry,
    napsán v čitelném stylu a být dobře dokumentován.

2. **Question**: Ano, vaši poslední poznámku, která odkazuje na politiky
    shledávám jako užitečnou obvzláště zde na FOSDEMU.
    No, my měli takovou malou zkušenost se setkáním mezi politiky
    a FOSDEM a reakce byli, "ne, ne, žádné politiky to je FOSDEM,
    to je pouze o open-source". Jak vnímáte oddělený vztahu
    mezi open-source a politky s ohledem na to co jste řekl na konci
    své přednášky?

    **Answer:**

    Cítím to stejně jako s globálním oteplováním.
    To že open source komunita nevěří politiku neznamená, že se
    politici jimi nebudou zabývat.
    Takže můžete sice politiky ignorovat, ale politici nebudou ignorovat vás.


3. **Question**: Děkuji za úžasnou přednášku.
    Možná jsem některé z těchto situací s přáteli zažil.
    Já se jen trochu podivuji ohledně OpenSSl.
    Jestliže to co říkáte odhadujete, protože zde je trochu hádání nebo...
    Ptám se sám sebe, jestli bychom měli opravdu zahájit nějaké vyšetřování
    na vlastní pěst jako open-source komunita v těchto případech.
    Možná v případě OpenSSL není žádná úmyslná škodolibost.
    Nejsem si jistý zdroji vašich analýz.

    **Answer:**

    Ukažte mi to.


4. **Question**: Ano, děkuji velmi za prezentace.
    Velmi zajímavé, velmi inspirativní pro rádoby NSA.
    Zmínil jste, že některé dokumenty od Snowdena nejspíše nebude nikdy
    odhalena, to jsou vaše přesná slova.
    Proč si toto myslíte? Proč si myslíte, že největší únik v historii
    lidstva v tomto momentě, by se mohl tiše schovat pod pokličku
    a lidé na to prostě zapomenou? Proč?

    **Answer:**

    Tři důvody:

    *Jedním z nich je* - že Glenn Greenwald je velmi zodpovědná osoba.
    Zde jsou nepochybně věci, které nebude publikovat, protože by to
    mohlo být velmi zničující z jakéhokoliv důvodu.

    *Druhá* - některé z informací budou tak technické, že nebude schopen je
    vysvětlit čtenářům The Guardian, mnohem méně pak ostatní noviny.

    *Třetí* - protože si myslí, že USA je připravena udělat dohodu se Snowdenem
    aby zastavila tok informací. Tohle bylo pro ně něco jako
    "Chinese water torture" (mučení pomocí kapek vody)
    Pokaždé když něco věřejně řekli tak o týden, dva později vyšli
    Snowdenove dokumenty, které ukazovali, že lžou.
    A já předpokládám, že jsou z tohohle už unaveni.
    Byl bych tedy dost překvapen, když by zde už nebylo zahájeno
    vyjednávání o podmínkách, které by umožnily návrat Snowdena zpět do USA
    a podmínkou návratu by bylo zastavení publikace dalších dokumentů.
    Jaké to budou podmínky, to se pravděpodobně nikdy nedovíme.

    Předpoládám, že v jednom momentu se dokumenty přestanou už objevovat
    a nikdy už znova o Snowdenovi neuslyšíme.
    Nemyslím si, že budou mít čas vypustit vše z toho co mají,
    bez ohledu na kolik toho bude NSA vědět.
    Chci říct, že nejzajímavější stránkou toho všeho je to,
    že NSA nemá absolutně tušení o tom co se vlastně děje.
    Vědí, že 4000 jejich zaměstnanců a dodavatelů použili tyto data na
    kontrolu svých milostných zájmů, ale oni to vědí pouze proto, že jim
    lidé tyto informace dobrovolně poskytli. Ale nevědí to protože by
    disponovali něčím jako "locked files" nebo něčím co by jim to ukazovalo.
    Jedná se tedy o naprosto děravý kbelík bez ponětí toho co se děje.
    Tohle by měl být opravodý skandál. To že jsou neprosto nekompetentní
    ke své práci.


5. **Question**: Nuže, první ze všeho děkuji za ohromnou přednášku.
    Rád bych se zeptal na vaši odpověď, jaká je úroveň na evropské úrovni,
    nemám na mysli politky v jednotlivých zemích, ale evropskou úroveň.
    My jsme viděli u toho CIA nebo NSA jak se bourají do amerických telefonů.
    Nevyznám se v kde je zde nějaké odmítnutí?

    **Answer:**

    Jsem si docela jistý, že nemají něco jako oddělení pro styk s veřejností,
    která by měla jakýkoliv vliv na tento druh rozhodování, ale pokud mají
    jsem si docela jistý, že oddělení pro styk s veřejností by rozhodlo, že
    ať už uděláte cokoliv, nenabourávejte se do telefonu od Merkelové.
    Merklová je jedna z osobností v evropě, kterou nechcete špehovat,
    protože pochází z východního Německa.
    Bylo by pro ně lepší, aby nevěděli co řekla do svého telefonu, než mít
    na stole to, co teď vyšlo na povrch.
    Nikdy bych tohle neriskoval, kdybych tam seděl a rozhodoval o tom.

    Další věcí co si myslím je, že kdokoliv si myslí, že může věřit svému
    telefonu, tak je jimi oklamán.
    Všechny mobily jsou kontrolovány všemi ostatními, jen ne tím,
    který nosí ten mobil ve své kapse.
    To stejné platí pro iPady, počítače a dalších.
    Nemyslím si, že máme mnoho zařízení u kterých můžeme říct, toto
    je garantováno, že není nabourané na tomto místě v tuto chvíli.
    To je prostor, kde by Evropská Unie mohla zakročit.
    Oni by vlastně mohli do toho vstoupit a pověřit počítačové platformy,
    které by potvrdili zařízení bez všech druhů sraček.
    Angela Merkel je vlastně vědkyně.
    Ona by myšlenku za tím mohla pochopit.
    Mohl jsem doufat, že by něco takového udělala a protlačila to skrze
    Evrospkou Unii.
    Bohužel, je neustále zaneprázdněna ekonomickou situací na jihu EU.
    Nevím jestli na to má čas, ale bylo by fajn mít místo,
    kde by osoba, která si zařízení koupí, si mohla být jista, že je ta jediná,
    která své zařízení ovládá.
    A Tel, telcos a lidé jako oni vypadli z našich telefonů.


6. **Question**: K politické diskuzi mám velmi malou poznámku.
    Technicky založení lidé si často myslí, že můžeme přemoci
    politické problémy, používáním technických nástrojů ve smyslu:
    "Oh, oni nás šmírují, hmm?! Teď ale máme šifrování, máme Tor apod."

    Ale tohle není ve skutečnosti otázka, protože my se můžeme vyhnout
    sledování za použití technických nástrojů.
    Ale otázkou je: Chceme skutečně společnost jako je tato?
    Věřím, že lidé jako my, kteří chápou věci více z technického úhlu pohledu
    bychom měli pomoci té druhé části společnosti.
    Myslím si, že se jedná opravdu o politický problém.
    Zde budou v květnu volby do Evropského parlamentu, kde budu ve skutečnosti
    kandidovat.

    **Answer:**

    Můžu s vámi jedině souhlasit, jedná se hlavně o to jaký druh společnosti
    chceme zanechat našim dětem.
    Některé z příležitostí k blbnutí či podělání něčeho, které jsme měli,
    tak naše děti mít nebudou bez toho, aniž by se to za 10 minut
    neobjevilo na YouTube.
    Uvědomil jsem si, že tohle je velké.
    Začnete uvažovat jinak jakmile máte děti.
    Musít to přiznat sám sobě, ale jsem přesvědčen, že ti z vás,
    kteří mají děti chápou co mám na mysli, když řeknu, že je to o tom
    v čem budou Vaši vnuci žít.

7. **Question**: Ahoj, velmi dobrá prezentace, odvážná a působivá.
    Zmínil jste strategii, že je docela snadné vyrušit významné
    open-source projekty pouhým vytvořením sporu nad issues,
    které byly problematické issues po dlouhou dobu a poté za 10 minut
    navrhujete vytrhnout OpenSSL ze všeho a nahradit jej nějakou
    novou implementací.
    V čem se to liší?

    **Answer:**

    Opravdu si myslíte, že je kontroverzní názor si myslet o OpenSSL,
    že je to něco jiného než kupa humusu?

    **Q7 continue...**

    Na internetu je vlastně plno komponentů, které na OpenSSL spoléhají
    kvůli šifrování.
    Pokud jej vytrhnete, tak zde nebude více bezpečno.
    Ono je to kontroverzní už je proto, že to příjímáte.
    A k vašemu komentáři. Jak uděláte něco více bezpečné,
    mám na mysli vždyť je to ten samý druh strategie, jako
    jste navrhoval v případě NSA a případných jiných zlých sil,
    které to páchají na dalších open-source projektech.

    **Answer continue ...:**

    A jak víte, že nepracuji pro NSA?

    **Q7 continue ...:**

    Přesně.

    **A continue ...:**

    To je komplikovaná otázka, což?
    A takových je hodně, pokud se chcete vydat po technické cestě.
    FreeBSD patch kolekce měla naposled co jsem se díval okolo 1342
    kopii algoritmu na šifrování md5.
    To je z hlediska sofwarového inženýra falešné.
    OpenSSL je cosi jako ne-řešení v tom, že máme tuhle knihovnu,
    která používá jakýkoliv algoritmus, kohokoliv kdo to vymyslel
    a výchozí stav vám umožňuje je použít.
    Všechny nízkoúrovňové útoky nejsou SSL, ale "pill area".
    Takže pokud chceme použít technické prostředky k tomu, abychom
    snížili schopnost vládních organizací ke pšehování lidí,
    musíme začít jednat jako vyspělí softwaroví vývojáři, kteří
    řeší věcí způsobem který má smysl, raději než říkáním:

    "Oh, mám tenhle nový úžasný algoritmus šoupnu do OpenSSL
    se zbytkem, takže budeme jich mít už 50."

    A také by to bude pravděpodobně vyžadovat určitý druh
    And that would probably require some kind of stavitelský
    dozor, což znamená, že budeme pravděodobně muset najít maximálně
    8 lidí na celém světě, kteří by se mohli shodnout a důvěřovat si.
    Můžeme začít například s Bruce Schneierem a sedm dalších.
    Ale nemyslím si, že schopnost ubližení je už na tak vysoké úrovni.
    Takže jednoduše nevěřím, že budeme mít technická řešení na tento problém.
    Vždy zde budou existovat nějaké bezpečnostní díry, kvůli toho, že někdo
    někde udělal nějakou hloupost.

    A velmi brzy budete stát proti velmi velkým společnostem,
    které mají velký zájem na obraně určitých protokolů a podobně.
    Myslím si, že OpenSSL dělá věci horší, protože lidé si myslí,
    že funguje.
    Lidé OpenSSL věří bez toho, aby tomu rozuměli.
    Potkal jsem dvě osoby, které prohlašovali, že rozumí OpenSSL,
    jeden z nich zcela jistě lhal.
    Takže ano opravdu si myslím, že OpenSSL je velký problém, protože lidé
    si myslí, že poskytuje bezpečí i když tomu tak ve skutečnosti není.

8. **Question**: Ano. Souhlasím s vámi, že se jedná o více politický problém,
    ale zajímalo by mě jak bych se měl či měli ptát nebo to vysvětlovat
    politikovi, pokud nějakého obsadím.
    Jaké konkrétní věci bych mu měl navrhnout?

    **Answer:**

    Myslím, že dobrým začátkem je požadovat vlastnictví našich zařízení....

    STŘIH VIDEA, zbytek odpovědi v záznamu z technických důvodů není.

9. **Question**:...............technicky řečeno měli bychom jít a opravit
    OpenSSL všude nebo měli bychom začít nový stack OpenSSL.
    Nebo co by mělo být našim domácím úkolem, zrovna jsme měli
    víkend plný technické záplavy. Co bychom tedy měli teď dělat
    kromě dorážení na naše politiky?

    **Answer:**

    Nevím.

    **Questioner:**

    Upřímně řečeno.

    **Answer continue...**
    Důvodem proč to nevím je, že nevidím technické řešení
    s rozpočtem jeden billion dolarů ke sběru informací, proti tomu
    se nejsme schopni postavit s jakýmkoliv technickým řešením.
    Vidím pouze politické řešení.
    Je zřejmé, že můžeme psát lepší kód, můžeme přestat pouze
    překopírovávat kusy kódu, kterému nerozumíme
    a použít místo toho knihovny a tak dále.
    A tohle může pomoci. Ale nevyřeší to problém.
    To pouze zavře pár bezpečnostních děr.
    Což je dobrý nápad, ale není to teď podstata problému.
    Ale ano, jo pište lepší kód!


**Moderator:**

Můžeme to zde ukončit? Ano.

Všem děkujeme.

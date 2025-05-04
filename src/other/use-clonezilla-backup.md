date: 2025-05-04
title: Jak si pomoci CloneZilla udelat obraz disku - pouze teoreticky


Vytvořím si [clonezilla - live](https://clonezilla.org/clonezilla-live.php) jako USB drive a nabootuješ do něj. Potom připojím disk, na kteýr chci zálohovat. Potom udělám zálohu nebo obraz disku laptopu do složky na externím disku, který jsem připojil pro zálohu.

Opačý proces je výběr složky, která byla vytvořena jako záloha disku a uděláš obnovu na disk laptopu.

Příklad použití: Koupíš notebook nebo dostaneš, kde je funkční windows. Nevíš jestli bude fungovat dobře Linux nebo BSD, ale nechceš widle a chceš zkusit, co na tom bude fičet. Potřebuješ si udělat zadní vrátka, že nebude fungovat nic a budeš tam muset dát zpatky původní windows. Tak na tohle se to přesně hodí ať tam aspoň v nejhorším jedou původní widle.

Teoreticky jdou takhle widle přenést na jakýkoliv jiný počítač. Prostě chytíš obraz widlí do pokeballu pomocí [CloneZilla](https://clonezilla.org/)
a pak tento obraz přeneseš na jiný komp. Otevřeš pokeball. Bohužel windows budou nejpsíše spárované s jedním hardwarem a nebude to asi fungovat, ale určitě to stojí někdy za vyzkoušení.

Originál:

I've just created a clonezille usb drive and booted into it. Then, plugged another drive and told it to backup the entire internal drive into a directory of the external device. Nothing more than this.
I don't know if this can be reused on another hardware. I think the license is for that specific device, but I'm not into Windows

Mount the destination (repository) disk and clonezilla will clone the partitions in compressed files inside that repo. Then, you can restore it into another disk. I'm not using it to move to other disks but just to keep a copy of the original windows, just in case I need to restore it for any reason

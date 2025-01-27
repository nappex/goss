title: Relace (vztah) mezi databázemi (tabulkami)
date: 2020-09-02
updated: 2024-11-30

# Databáze - obecně

Každá databáze se skládá z entit. Třeba databáze uživatelů je databáze entit, kde každý uživatel je jedna entita. Tato entita je definována svými atributy. Tyto atributy mohou být rodné číslo, jméno, přezdívka, email apod. A každý atribut má svou hodnotu. Hodnota emailu může být třeba pepanovak@seznam.cz.

Databáze jsou dva hlavní typy:

1. Flat-File Database: tedy obyčejný soubor jako databáze. Například CSV, Excel spreadsheet, LibreOffice spreadsheet apod.Tyto databáze jsou vhodné pro menší počet dat, jelikož procházení dat nebývá moc efektivní.

2. Relational database: neboli relační databáze. Jedná se přímo už o program, který spravuje data hlavně v paměti RAM, ale aby byl schopen data i uchovávat tak je také ukládá do souborů. Nicméně požadavky na data dělá speciální program, který je při manipulaci s daty daleko více efektivní než flat-file databáze. V praxi to vypadá tak, že máte binární soubor, kde jsou uložena všechna data. Tím, že soubor binární tak jde otevřít pouze speciálním programem a nikoliv textovým editorem, tak jako je tomu u flat-file databazí. Tím programem je třeba `SQLite`, sqlite otevře binární soubor a pomocí příkazů mění data v tomto souboru, která jsou uložena v tzv. `tables`. Příkazy, které se použivají k manipulaci s daty jsou příkazy jazyka SQL - Structred Query Language Programy, tento jazyk se používá u databází jako MySQL, PostgreSQL a další. Tedy k interakci s daty je nutné znát syntaxy jazyka pro práci s databází. K manipulaci dat se používají 4 základní operace označovaných pod zkratkou `CRUD`, což je:

- C - Create (SQL uses also INSERT)
- R - Read (SQL uses insted SELECT)
- U - Update
- D - Delete

As you see SQL for example uses not literally same named operations as in general definition. But the `SELECT` is the same thing what it is meant by operation `READ`, `SELECT` == `READ`.

# Relační databáze

## 1. Žádný vztah

Mezi tabulkami nebo databázemi není žádný vztah.

## 2. Vztah 1:1 one-to-one

Tento vztah není příliš častý, jelikož z dvou tabulek, které mají mezi sebou tento vztah můžeme většinou vytvořit jednu. [[1]](#link1)

## 3. Vztah 1:N one-to-many

Můžeme si představit jako jednoho zákazníka z nějaké databáze, který vytvoří novou databázi ve formě několika objednávek. Nebo máme jednoho uživatele na blogu, který vytvoří několik postů. Ale každý post má pouze jednoho autora. V tomto případě se vztah nejčastěji řeší přidáním jednoznačného identifikátoru (foreign key) zákazníka nebo uživatele (např. user_id, customer_id) do každého řádku databáze objednávek či postů blogu. Každá objednávka nebo post tak bude identifikovatelná, kým byla vytvořena.[[1]](#link1)

## 4. Vztah M:N many-to-many

Tato relace je mezi tabulkami Výrobky a Objednávky. Jedna objednávka může obsahovat více výrobků. Na druhou stranu se jeden výrobek může objevit v mnoha objednávkách. Pro řešení tohoto vztahu se musí vytvořit třetí tabulka, která je charakterizovaná vztahem 1:N a 1:M.

# Použité zdroje - další studium

[1] - https://support.microsoft.com/cs-cz/office/p%c5%99%c3%adru%c4%8dka-k-relac%c3%adm-mezi-tabulkami-30446197-4fbe-457b-b992-2f6fb812b58f?ui=cs-cz&rs=cs-cz&ad=cz <a name="link1"></a>

[2] - https://docs.microsoft.com/cs-cz/office/troubleshoot/access/define-table-relationships

[3] - https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-viii-followers

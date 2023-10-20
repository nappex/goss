---
Title: Relace (vztah) mezi databázemi (tabulkami)
Date: 2020-9-2
Category: Databases
Tags: databases, beginners, relations
Slug: databases-relations
Authors: David
Summary: Four basic relations between databases
Status: published
---

[TOC]

# Databáze - obecně

Každá databáze se skládá z entit. Třeba databáze uživatelů je databáze entit, kde každý uživatel je jedna entita. Tato entita je definována svými atributy. Tyto atributy mohou být rodné číslo, jméno, přezdívka, email apod. A každý atribut má svou hodnotu. Hodnota emailu může být třeba pepanovak@seznam.cz.

# 1. Žádný vztah

Mezi tabulkami nebo databázemi není žádný vztah.

# 2. Vztah 1:1 one-to-one

Tento vztah není příliš častý, jelikož z dvou tabulek, které mají mezi sebou tento vztah můžeme většinou vytvořit jednu. [[1]](#link1)

# 3. Vztah 1:N one-to-many

Můžeme si představit jako jednoho zákazníka z nějaké databáze, který vytvoří novou databázi ve formě několika objednávek. Nebo máme jednoho uživatele na blogu, který vytvoří několik postů. Ale každý post má pouze jednoho autora. V tomto případě se vztah nejčastěji řeší přidáním jednoznačného identifikátoru (foreign key) zákazníka nebo uživatele (např. user_id, customer_id) do každého řádku databáze objednávek či postů blogu. Každá objednávka nebo post tak bude identifikovatelná, kým byla vytvořena.[[1]](#link1)

# 4. Vztah M:N many-to-many

Tato relace je mezi tabulkami Výrobky a Objednávky. Jedna objednávka může obsahovat více výrobků. Na druhou stranu se jeden výrobek může objevit v mnoha objednávkách. Pro řešení tohoto vztahu se musí vytvořit třetí tabulka, která je charakterizovaná vztahem 1:N a 1:M.

# Použité zdroje - další studium

[1] - https://support.microsoft.com/cs-cz/office/p%c5%99%c3%adru%c4%8dka-k-relac%c3%adm-mezi-tabulkami-30446197-4fbe-457b-b992-2f6fb812b58f?ui=cs-cz&rs=cs-cz&ad=cz <a name="link1"></a>

[2] - https://docs.microsoft.com/cs-cz/office/troubleshoot/access/define-table-relationships

[3] - https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-viii-followers
---
Title: Datové typy v programovacím jazyce Elixir
Date: 2022-07-20
Category: Elixir, Basics
Tags: elixir, basics, beginners
Slug: elixir-data-types
Authors: David
Summary: Elixir data types
Status: published
---

[TOC]

# Integery

Jedná se o klasická celá čísla (..., -2, -1, 0, 1, 2, ...). Elixir programátora neomezuje jak velké či malé celé číslo musí být. V Elixiru lze pracovat i s opravdu velkými čísly, pokud k tomu je dostatek paměti RAM. Opravdu obrovská čísla mají vliv na čas výpočtu, ale pro lidské vnímání je tohle zpomalení naprosto zanedbatelné.

```elixir
iex(32)> 1234567891213138138138138138138138138 * 123214214214921472183210381203210302183 * 2137219321893821932819382198321939218312397219372179397213792173921 * 1232197321382109380213802183021830218302183021830218321083

400594646853992190082002975842596344158763794851066296804174448360912820881791327328524271478958550937298500527252420039610916215518991162308707268780961153676937620548947878554152771938882068481522
```

Pro lepší čitelnost čísel můžeme číslice oddělit podrtžítkem do skupin dle naší libosti, jak to umožňuje například i jazyk Python. Na čas kompilace to nemá žádný vliv. Elixir tyto podtržítka zcela ignoruje.

```elixir
iex> 34_677_455_123
34677455123
iex> 34_4_1
3441
```

Pro práci s celými čísly jazyk Elixir poskytuje celou řadu užitečných funkcí nebo Guards. Některé funkce jako `div` nebo `abs` nalezneme jako součást jádra jazyka Elixir [Kernel](https://hexdocs.pm/elixir/1.13.4/Kernel.html).

```elixir
iex> div(10, 3)
3
iex> rem(10, 3)
1
```

Další užitečné funkce jako například `digits` a `pow`, nebo tzv. Guards jako `is_even` nalezneme v modulu [Integer](https://hexdocs.pm/elixir/1.13.4/Integer.html).

```elixir
iex> Integer.digits(10)
[1, 0]
iex> Integer.pow(3, 2)
9
```

Datový typ *Integer* můžeme mezi sebou sčítat, odečítat, násobit či dělit. V případě dělení je výsledek automaticky převeden na datový typ *Float*.
```elixir
iex> 3 + 4
7
iex> 2 - 4
-2
iex> 3 * 4
12
iex> 12 / 3
4.0
```

Integers lze také pomocí předpony v zápisu zapsat v různých číselných soustavách:

* binární (dvojková),
* oktální (osmičková),
* hexadecimální (šestnáctková).

```elixir
iex> 0b0111
7
iex> 0o345
229
iex> 0xFF
255
```

# Floaty

Jedná se o čísla s plovoucí čárkou, zjednodušeně desetinná čísla.
Jedná se o čísla, která mají alespoň jedno desetinné místo - desetinná čísla. I když se tyto čísla někdy nazývají s také jako čísla s plouvoucí čárkou, v jazyce Elixir je zapisujeme pomocí tečky.
```elixir
iex> float_number = 8.34
8.34
iex> i float_number
Term
  8.34
Data type
  Float
Reference modules
  Float
Implemented protocols
  IEx.Info, Inspect, List.Chars, String.Chars
iex> IEx.Info.info(8.34)
[{"Data type", "Float"}, {"Reference modules", "Float"}]
```

Jazyk Elixir používá formát 64-bit s dvojitou přesností.
They use the 64-bit double precision floating-point format.

Práce s čísly typu Float je velmi podobná jako s Integers.

Například podtržítka fungují stejně.

```elixir
iex> 23_34.43_222
2334.43222
```

Užitečné funkce pro práci s Floats nalezneme opět v Kernelu a v modulu [Float](https://hexdocs.pm/elixir/1.13.4/Float.html)

Elixir má podporu vědeckého zápisu čísel typu float pomocí exponentu `e`.
```elixir
iex> 12345.999e-2
123.45999
```

Pozor si musíme dát na jemnou nepřesnost při výpočtech desetinné části. Z tohoto důvodu se nedoporučuje tento typ používat na výpočty financí. S tímto problémem se ovšem potýká více programovacích jazyků. Pro přesné výpočty se používají speciální datové type jako například v C# čísla s pevnou desetinnou tečkou (fixed-point number).

```elixir
iex> 3.34 - 3.35
-0.010000000000000231
```

# Atomy

Atom je konstanta, jehož jméno je zároveň jeho hodnotou. Jedná se o stejnou filosofii s jakou Symboly fungují v jazyce Ruby.

Upřímně, dlouho mi trvalo než jsem atomy dostal trochu více pod kůži. Moc jsem nechápal jejich přidanou hodnotu a proč nestačí mít pouze datový typ string. Všude přítomné vysvětlení, že se jedná o konstantu, jejíž jméno je zároveň její hodnotou, mi úplně nepomohlo. Naštěstí jsem nalezl docela užítečný článek[1], který se o této problematice rozepisuje trochu více. Je dobré si uvědomit, že atomy jsou konstanty s unikátní hodnotou. Často se tak setkáte s atomy `:ok` nebo `:error`, které vyjadřují stav nějaké operace. Tento případ přímo vybízí k použití něčeho jako jsou atomy.

```elixir
iex> :pes == :kocka
false
iex> :pes == :pes
true
```

Díky své unikátnosti se atomy hodí také jako klíče to struktur typu klíč - hodnota. Atomy se v jazyce Elixir ukládájí do jakési tabulky atomů, kde jsou uloženy po celou dobu. Jakmile jednou vytvoříte atom, tak už jej nevymažete.  Jejich vnitřní hodnotu nelze změnit.[4] Není tedy dobrý nápad vytvářet velký počet atomů. Navíc, maximální počet atomů je v Erlang virtual machine omezen na 1,048,576.[1] Když uložíte do více proměnných stejný atom, tak tento atom existuje ve skutečnosti pouze jednou a je všemi proměnnými sdílen.
Atomy jsou unikátní napříč celým runtime prostředím, což je velmi užitečná vlastnost pro komunikaci napříč procesy. Atomy jsou vlastně takové globální proměnné. Naproti tomu většina dat v Elixiru včetně stringů zůstavají alokována v daném procesu. Další výhodou oproti stringům je fakt, že práce s atomy je daleko efektivnější. Atomy jsou vnitřně ukládány jako integers, takže například porovnávání atomů je daleko rychlejší než mezi stringy.[1][4] Z výše uvedených důvodů se nedoporučuje zacházet s atomy s jako dynamickými daty, napříkladukládat vstupy uživatelů v datovém typu atom. Posledním faktem je, že Erlang VM má postavený celý koncept paralelizace na atomech.[1]

Zápis atomu začíná dvojtečkou `:`, za kterou musí následovat text.

```elixir
iex> :foo
:foo
iex> i(:foo)
Term
  :foo
Data type
  Atom
Reference modules
  Atom
Implemented protocols
  IEx.Info, Inspect, List.Chars, String.Chars
```

Všechny atomy musí začínat po dvojtečce písmenem, v opačném případě dostaneme `SyntaxError`.

```elixir
iex> :4ee
** (SyntaxError) iex:25:1: unexpected token: ":" (column 1, code point U+003A)
iex> :@ab
** (SyntaxError) iex:55:3: syntax error before: ab
iex> :e43
:e43
iex> :foo@bar
:foo@bar
```

Více slovní atomy oddělujeme podtržítkem.

```elixir
iex> :atom_z_vice_slov
:atom_z_vice_slov
```

Pokud potřebujeme použít zakázané znaky na začátku atomu (čísla, @, !, ? ...) nebo použít mezer mezi slovy, musíme celý název atomu obalit do uvozovek.

```elixir
iex> :"atom z vice slov"
:"atom z vice slov"
iex> :"12"
:"12"
iex> :"@ab"
:"@ab"
```

Ke kontrole, zda je daný objekt atom či nikoliv můžeme použít vestavěnou funkci `is_atom`.

```elixir
iex> is_atom(:foo)
true
iex> is_atom :foo
true
iex> is_atom "foo"
false
iex> is_atom 444
false
```

Existuje i několik výjimek u kterých se nemusí psát počáteční dvojtečka. Jedná se o `true`, `false` a `nil`. V těchto případech vůbec nezáleží jestli před ně dvojtečku napíšeme či nikoliv a pořád se jedná o jeden stejný objekt.

```elixir
iex> is_atom(true)
true
iex> is_atom(:true)
true
iex> true == :true
true
iex> is_atom(nil)
true
ies> nil == :nil
true
```

Další objekty u kterých bychom nejspíš nečekali, že budou atomy jsou aliasy a názvy modulů včetně modulů, které nejsou deklarované. U těchto atomů se totiž dvojtečky vůbec nepíšou. Neplatí pro ně jako v předchozím příkladu, že v případě objektu s dvojtečkou a bez se jedná o totéž.

```elixir
iex> is_atom(Ahoj)
true
iex> is_atom(:Ahoj)
true
iex(8)> Ahoj == :Ahoj
false
iex> is_atom(MojeAplikace.MujModul)
true
```

Atomy se používají také v názvu Erlangových modulů při odkazování na konkrétní funkci.[3] Erlangové moduly na rozdíl od elixírových začínají malým písmenem, nejedná se u nich tedy o `Aliasy`. Volání erlanogových modulů je v Elixíru vyřešeno pomocí `Atomů`. Více to bude možná jasnější z kapitoly [Aliasy](##aliasy).

```elixir
iex> :crypto.strong_rand_bytes 3
<<23, 104, 108>>
```

## Aliasy

Aliasy jsou atomy, ale začínají místo dvojtečky `:` velkým písmenem.

```elixir
iex> is_atom(Ahoj)
true
```

Aliasy se v Elixíru nastavují následujícím způsobem.

```elixir
iex> alias :nejaky_dlouhy_atom, as: MujAlias
:nejaky_dlouhy_atom
iex> MujAlias
:nejaky_dlouhy_atom
iex> Atom.to_string(MujAlias)
:nejaky_dlouhy_atom
```

Alias lze použít i bez toho, aniž bychom jej dopředu nastavili. Výchozí hodnota takového Aliasu je nastavena jako atom :"Elixir.DalsiAlias". Voláme-li námi definovaný modul hledá se pod cestou Elixir.NasModul. Vytvoříme-li soubor zviratka.ex a nadefinujeme si s v něm moduly `Pes` a `Kočka`, po kompilaci budeme mít k dispozici `Elixir.Pes.beam` a `Elixir.Kočka.beam`.

```elixir
iex> DalsiAlias
DalsiAlias
iex> Atom.to_string(DalsiAlias)
"Elixir.DalsiAlias"
iex> DalsiAlias == "Elixir.DalsiAlias"
false
iex> DalsiAlias == :"Elixir.DalsiAlias"
true
```

Definice aliasu lze zapsat takě bez nově definovaného jména (odkazu).

```elixir
alias MyApp.Account.User
# je totéž jako bychom napsali
alias MyApp.Account.User, as: User
```

Aliasy se používají především v případech, kde potřebujeme vytvořit odkaz například na modul pod kratším či vhodnějším jménem. V příkladu níže si pomocí aliasu můžeme nastavit zkrácené jméno (odkaz) `I` pro modul Integer, nově tak můžeme modul Integer volat pouze pomocí odkazu `I`.

```elixir
alias Integer, as: I
I.pow(2, 3)
```

Dobrým zvykem je definovat aliasy na začátku modulu.

# Booleans

Programovací jazyk Elixir podporuje dvě boolean hodnoty a to `true` a `false`. Velmi zajímavé je, že ve skutečnosti jsou tyto booleanovské hodnoty pouze odkazy k atomům `:true` a `:false`. Hodnoty `true` a `false` jsou tedy čistě jen pseudonymy pro atomy.

Všechny boolean hodnoty jsou atomy a ne všechny atomy jsou booleany.[1]

```elixir
iex(27)> true == :true
true
iex(28)> true === :true
true
```

# Strings

# Binaries

# Bitstrings

# Charlists

# Ranges

# Collection types

## Tuples

## Lists

## Keyword lists

## Maps

## Sets

## Binaries/Bitstrings

## Structs

# Sigils

## regex

# Speciální datové typy

## Port

## Reference

## pid



# Zdroje

[1] [inquisitivedeveloper](https://inquisitivedeveloper.com/lwm-elixir-6/)
[2] [elixir-lang.org](https://elixir-lang.org/getting-started/basic-types.html)
[3] [elixirschool.com](https://elixirschool.com/en/lessons/basics/basics)
[4] [exercism](https://exercism.org/tracks/elixir/concepts/)
[5] [tutorialspoint](https://www.tutorialspoint.com/elixir/elixir_data_types.htm)
